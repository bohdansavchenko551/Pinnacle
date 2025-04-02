//
//  NewHomeView.swift
//  Pinnacle
//
//  Created by D K on 31.03.2025.
//

import SwiftUI


#Preview {
    NewTabView()
        .environmentObject(AuthViewModel())
}

class TabViewModel: ObservableObject {
    @Published var isShown = true
}

enum NewTab: Int, Identifiable, CaseIterable {
    case main, home, notes, profile

    var id: Int { self.rawValue }
    
    var iconName: String {
        switch self {
        case .main: return "line.3.horizontal"
        case .home: return "newHomeIcon"
        case .notes: return "newCardsIcon"
        case .profile: return "newProfileIcon"
        }
    }

    // Пример представлений для каждого таба
    @ViewBuilder
    var view: some View {
        switch self {
        case .main: NewHome()
        case .home: NewHome()
        case .notes: SportNotesView()
        case .profile: ProfileView()
        }
    }
}

// 2. Основное ContentView, которое будет содержать все
struct NewTabView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var vm = TabViewModel()
    // Состояние для отслеживания выбранного таба
    @State private var selectedTab: NewTab = .main
    // Состояние для отслеживания, раскрыт ли кастомный таббар
    @State private var isExpanded: Bool = false

    // Определим, какие табы будут на дуге (исключая центральный, если он 'home')
    let arcTabs: [NewTab] = NewTab.allCases.filter { $0 != .main } // Или задайте явно [.search, .notifications, .profile]

    var body: some View {
        NavigationStack {
            
            ZStack(alignment: .bottom) {
                // --- Отображение контента выбранного таба ---
                selectedTab.view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .environmentObject(authViewModel)
                // Добавим немного отступа снизу, чтобы контент не заезжал под таббар
                // В реальном приложении это может быть не нужно, если таббар прозрачный
                // .padding(.bottom, 80)
                
                // --- Полупрозрачный фон при раскрытии (необязательно) ---
                if isExpanded {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            // Закрываем по тапу на фон
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isExpanded = false
                            }
                        }
                        .transition(.opacity) // Анимация появления/исчезновения фона
                }
                
                if vm.isShown {
                    // --- Сам кастомный таббар ---
                    CustomArcTabBar(
                        selectedTab: $selectedTab,
                        isExpanded: $isExpanded,
                        centerTab: .main, // Таб для центральной кнопки
                        arcTabs: arcTabs   // Табы для дуги
                    )
                }
                
            }
            // Игнорируем safe area для клавиатуры, чтобы таббар оставался видимым
            .ignoresSafeArea(.keyboard)
        }
    }
}

// 3. Представление кастомного таббара
struct CustomArcTabBar: View {
    @Binding var selectedTab: NewTab
    @Binding var isExpanded: Bool

    let centerTab: NewTab
    let arcTabs: [NewTab]

    // Параметры для настройки внешнего вида
    let centerButtonSize: CGFloat = 65
    let arcButtonSize: CGFloat = 48
    let arcRadius: CGFloat = 100 // Радиус дуги
    let arcAngleSpread: Double = 120 // Угол разброса иконок по дуге (в градусах)

    var body: some View {
        ZStack(alignment: .bottom) {
            // --- Фоновая дуга (визуальная часть) ---
            // Имитирует полупрозрачный зеленый фон из примера
            if isExpanded {
                ArcShape(radius: arcRadius + arcButtonSize * 0.7, angleSpread: arcAngleSpread + 115) // Чуть больше кнопок
                    .fill(.cutsomOrange.opacity(0.3)) // Можно использовать .fill(Color.green.opacity(0.2))
                    .frame(width: (arcRadius + arcButtonSize) * 2, height: (arcRadius + arcButtonSize) * 2)
                    .offset(y: -centerButtonSize * 0.3) // Сдвигаем вверх
                    .transition(.scale(scale: 0.1, anchor: .bottom).combined(with: .opacity))
                    .allowsHitTesting(false) // Не мешает нажатиям на кнопки
            }

            // --- Кнопки на дуге ---
            ZStack {
                ForEach(Array(arcTabs.enumerated()), id: \.element.id) { index, tab in
                    Button {
                        handleTabSelection(tab)
                    } label: {
                        Image(tab.iconName)
                            .resizable()
                            .frame(width: arcButtonSize + 10, height: arcButtonSize + 10)
                            .background(.regularMaterial) // Фон кнопки (белый/серый)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
                    }
                    .offset(arcOffset(for: index, count: arcTabs.count))
                    // Анимация появления/исчезновения и положения
                    .opacity(isExpanded ? 1 : 0)
                    .animation(
                        .spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)
                         .delay(isExpanded ? Double(index) * 0.05 : Double(arcTabs.count - 1 - index) * 0.03), // Небольшая задержка для "веера"
                        value: isExpanded
                    )
                }
            }
            // Позиционируем блок с кнопками дуги над центральной кнопкой
            .offset(y: -centerButtonSize * 0.6)
            // Скрываем весь блок, если не раскрыто (для более плавной анимации)
            .opacity(isExpanded ? 1 : 0)


            // --- Центральная кнопка ---
            Button {
                // Анимированное раскрытие/сворачивание
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
                    isExpanded.toggle()
                    // Если центральная кнопка также выбирает таб (например, Home)
                    // selectedTab = centerTab // Раскомментируйте, если нужно
                }
            } label: {
                ZStack {
                    Image("tabIcon")
                        .resizable()
                        .frame(width: centerButtonSize, height: centerButtonSize)
                    
                    Image(systemName: isExpanded ? "xmark" : centerTab.iconName) // Меняем иконку при раскрытии
                        .font(.system(size: centerButtonSize * 0.4, weight: .medium))
                        .foregroundColor(.white) // Цвет иконки
                        .rotationEffect(.degrees(isExpanded ? 90 : 0)) // Небольшой поворот для "xmark"
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                        .offset(y: -5)
                }
            
            }
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 > 0 ? 5 : 20)

        }
    }

    // Функция для вычисления смещения кнопок по дуге
    private func arcOffset(for index: Int, count: Int) -> CGSize {
        // Рассчитываем угол для текущей кнопки
        // Начальный угол (например, -60 градусов для левой кнопки)
        let startAngle: Double = -90 -  (arcAngleSpread / 2.0)
        // Шаг угла между кнопками
        let angleStep: Double = (count > 1) ? arcAngleSpread / Double(count - 1) : 0
        // Угол текущей кнопки
        let angle = startAngle + Double(index) * angleStep

        // Переводим градусы в радианы
        let angleRadians = Angle(degrees: angle).radians

        // Вычисляем смещение по X и Y
        let xOffset = arcRadius * CGFloat(cos(angleRadians))
        let yOffset = arcRadius * CGFloat(sin(angleRadians)) + 30

        // Возвращаем смещение, если дуга раскрыта, иначе - нулевое смещение
        return isExpanded ? CGSize(width: xOffset, height: yOffset) : .zero
    }

    // Функция обработки нажатия на кнопку дуги
    private func handleTabSelection(_ tab: NewTab) {
        withAnimation(.interpolatingSpring(stiffness: 170, damping: 15)) {
            selectedTab = tab
            isExpanded = false // Закрываем дугу
        }
    }
}

// 4. Вспомогательная фигура для фона дуги (необязательно)
struct ArcShape: Shape {
    let radius: CGFloat
    let angleSpread: Double // в градусах

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.maxY) // Центр дуги внизу по центру

        // Углы в радианах
        let startAngle = Angle(degrees: -90 - angleSpread / 2.0)
        let endAngle = Angle(degrees: -90 + angleSpread / 2.0)

        // Добавляем дугу
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)

        return path
    }
}

