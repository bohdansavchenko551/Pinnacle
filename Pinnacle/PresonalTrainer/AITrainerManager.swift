//
//  AITrainerManager.swift
//  Pinnacle
//
//  Created by D K on 01.04.2025.
//

import Foundation


// MARK: - AI Trainer Manager
class AITrainerManager {

    private let apiKey: String
    private let modelName = "gemini-1.5-flash-latest" // Или другая модель
    private lazy var baseURL = "https://generativelanguage.googleapis.com/v1beta/models/\(modelName):generateContent"

    // --- Системная инструкция для AI ---
    // Это ключ к ограничению поведения модели.
    private let systemInstruction = """
    You are an advanced AI acting as a personal fitness trainer and healthy eating expert.
    Your task is to answer ONLY questions related to the following topics:
    - Physical exercise (exercise technique, training programs, types of sports)
    - Nutrition (diet planning, diets for athletes, macro/micronutrients, hydration)
    - Healthy lifestyle (daily routine, sleep, recovery after training, motivation)
    - Sports physiology and anatomy in the context of training.

    You MUST politely REFUSE to answer ANY questions that go beyond these topics.
    Examples of topics you will NOT answer: politics, history, geography, math, programming, celebrities, general knowledge, weather, etc.

    If a user asks an off-topic question, your response MUST be something like:
    "Sorry, I'm your personal AI trainer and can only discuss topics related to sports, fitness, nutrition, and healthy living. I can't answer your question about [mention briefly the topic of the question if appropriate, but not required]."

    IMPORTANT: Don't try to find a connection between an irrelevant question and sports if there isn't one. Just say no. Don't answer forbidden topics under any circumstances, even if the user insists or tries to trick you (e.g. by mixing topics). Be strict in your role.
    """

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    // --- Основной метод для отправки сообщения ---
    /// Отправляет текстовый запрос к API Gemini и возвращает ответ.
    /// - Parameters:
    ///   - userPrompt: Текст вопроса пользователя. // Переименовали для ясности
    ///   - completion: Замыкание, вызываемое по завершении запроса. Возвращает Result<String, Error>.
    func sendMessage(prompt userPrompt: String, completion: @escaping (Result<String, Error>) -> Void) { // Оставил 'prompt' как имя параметра для совместимости с ViewModel

        // --- Формируем полный промпт с инструкцией ---
        // Объединяем системную инструкцию и вопрос пользователя.
        // Можно использовать разделитель для лучшего понимания моделью.
        let fullPrompt = "\(systemInstruction)\n\n---\n\nВопрос пользователя: \(userPrompt)"
        // --- Конец формирования полного промпта ---


        // 1. Формируем URL
        guard var urlComponents = URLComponents(string: baseURL) else {
            completion(.failure(AITrainerError.invalidURL))
            return
        }
        urlComponents.queryItems = [URLQueryItem(name: "key", value: apiKey)]

        guard let url = urlComponents.url else {
            completion(.failure(AITrainerError.invalidURL))
            return
        }

        // 2. Создаем тело запроса, используя ПОЛНЫЙ промпт
        let requestBody = GeminiRequest(contents: [Content(parts: [Part(text: fullPrompt)])]) // Используем fullPrompt здесь!

        // 3. Кодируем тело запроса в JSON
        // ... (остальной код без изменений)
        let encoder = JSONEncoder()
        guard let requestData = try? encoder.encode(requestBody) else {
            completion(.failure(AITrainerError.decodingError(EncodingError.invalidValue("Failed to encode request body", .init(codingPath: [], debugDescription: "")))))
            return
        }

        // 4. Создаем URLRequest
        // ... (остальной код без изменений)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestData

        // 5. Выполняем сетевой запрос
        // ... (остальной код без изменений, включая обработку ответа и ошибок)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            func completeOnMain(_ result: Result<String, Error>) {
                DispatchQueue.main.async {
                    completion(result)
                }
            }

            if let error = error {
                completeOnMain(.failure(AITrainerError.requestFailed(error)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                if let data = data,
                   let errorJson = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let errorDict = errorJson["error"] as? [String: Any],
                   let message = errorDict["message"] as? String {
                    completeOnMain(.failure(AITrainerError.apiError(message)))
                } else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                    completeOnMain(.failure(AITrainerError.invalidResponse(statusCode: statusCode))) // Добавим код статуса для отладки
                }
                return
            }

            guard let data = data else {
                completeOnMain(.failure(AITrainerError.noData)) // Заменим invalidResponse на более конкретную ошибку
                return
            }

            let decoder = JSONDecoder()
            do {
                let geminiResponse = try decoder.decode(GeminiResponse.self, from: data)
                // Улучшенная проверка на наличие текста ответа
                if let responseText = geminiResponse.candidates?.first?.content.parts.first?.text, !responseText.isEmpty {
                    completeOnMain(.success(responseText))
                } else {
                    // Дополнительно проверим, не заблокирован ли ответ из-за safety settings
                    if let blockReason = geminiResponse.promptFeedback?.blockReason {
                         completeOnMain(.failure(AITrainerError.responseBlocked(reason: blockReason)))
                    } else if geminiResponse.candidates?.isEmpty ?? true {
                         completeOnMain(.failure(AITrainerError.noCandidates))
                    } else {
                         completeOnMain(.failure(AITrainerError.noResponseText))
                    }
                }
            } catch {
                completeOnMain(.failure(AITrainerError.decodingError(error)))
            }
        }
        task.resume()
    }
}

// MARK: - Error Handling (дополненный)
enum AITrainerError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse(statusCode: Int) // Добавлен код статуса
    case apiError(String)
    case decodingError(Error)
    case noData // Добавлено
    case noCandidates // Добавлено
    case noResponseText
    case responseBlocked(reason: String?) // Добавлено для safety / других блокировок

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Не удалось создать URL для запроса к API."
        case .requestFailed(let error):
            return "Ошибка сетевого запроса: \(error.localizedDescription)"
        case .invalidResponse(let statusCode):
            return "Получен некорректный ответ от сервера (HTTP \(statusCode))."
        case .apiError(let message):
            return "Ошибка API Gemini: \(message)"
        case .decodingError(let error):
            // Добавим больше деталей об ошибке декодирования
            if let decodingError = error as? DecodingError {
                return "Ошибка декодирования ответа: \(decodingError.detailedDescription)"
            } else {
                return "Ошибка декодирования ответа от API: \(error.localizedDescription)"
            }
        case .noData:
            return "Сервер не вернул данные в ответе."
        case .noCandidates:
             return "API не вернуло кандидатов для ответа."
        case .noResponseText:
            return "В ответе API не найден текст."
        case .responseBlocked(let reason):
            return "Ответ был заблокирован API. Причина: \(reason ?? "не указана"). Возможно, из-за настроек безопасности или контента промпта."
        }
    }
}

// MARK: - Response Structures (дополненные для promptFeedback)
struct GeminiResponse: Codable {
    let candidates: [Candidate]?
    let promptFeedback: PromptFeedback? // Добавлено
}

// Добавлена структура для promptFeedback
struct PromptFeedback: Codable {
    let blockReason: String?
    // Могут быть и другие поля, например, safetyRatings
}

// Дополнительное расширение для DecodingError для лучшей отладки
extension DecodingError {
    var detailedDescription: String {
        switch self {
        case .typeMismatch(let type, let context):
            return "Type mismatch for type \(type) at path \(context.codingPath.map { $0.stringValue }.joined(separator: ".")): \(context.debugDescription)"
        case .valueNotFound(let type, let context):
            return "Value not found for type \(type) at path \(context.codingPath.map { $0.stringValue }.joined(separator: ".")): \(context.debugDescription)"
        case .keyNotFound(let key, let context):
            return "Key not found: \(key.stringValue) at path \(context.codingPath.map { $0.stringValue }.joined(separator: ".")): \(context.debugDescription)"
        case .dataCorrupted(let context):
            return "Data corrupted at path \(context.codingPath.map { $0.stringValue }.joined(separator: ".")): \(context.debugDescription)"
        @unknown default:
            return "Unknown decoding error: \(self.localizedDescription)"
        }
    }
}


// Остальные структуры (GeminiRequest, Content, Part, Candidate, ContentResponse, PartResponse) остаются без изменений.
// Ваш ViewModel (TrainerViewModel) и View (HomeView) также остаются без изменений, так как вся логика ограничения инкапсулирована в AITrainerManager.

// MARK: - Request Structures (Codable)
// Структуры для формирования JSON-тела запроса
struct GeminiRequest: Codable {
    let contents: [Content]
}

struct Content: Codable {
    let parts: [Part]
}

struct Part: Codable {
    let text: String
}

// MARK: - Response Structures (Codable)

struct Candidate: Codable {
    let content: ContentResponse
    // Могут быть и другие поля: finishReason, safetyRatings и т.д.
}

struct ContentResponse: Codable {
    let parts: [PartResponse]
    let role: String // Обычно "model"
}

struct PartResponse: Codable {
    let text: String
}
