// swift-utility-demo.swift

// ============ guard 语句 ============
func processInput(_ input: String?) {
    guard let value = input else {
        print("输入为空")
        return
    }
    print("处理: \(value)")
}

processInput("Hello")
processInput(nil)

// ============ defer 语句 ============
func processFile() {
    print("1. 打开文件")

    defer {
        print("4. 关闭文件")
    }

    defer {
        print("3. 释放资源")
    }

    print("2. 处理数据")
}

processFile()

// ============ if case ============
enum Color {
    case red
    case green
    case blue
    case unknown
}

let color: Color = .green

if case .green = color {
    print("颜色是绿色")
}

if case .red = color {
    print("颜色是红色")
} else {
    print("颜色不是红色")
}

// 配合可选值
let optionalColor: Color? = .blue
if case .blue? = optionalColor {
    print("可选颜色是蓝色")
}

// ============ for case ============
let colors: [Color?] = [.red, nil, .green, .blue, nil]

print("\n非nil的颜色:")
for case let color? in colors {
    print("  \(color)")
}

// ============ 模式匹配 ============
let tuple = (1, 2)
switch tuple {
case let (x, y) where x == y:
    print("相等: \(x) = \(y)")
case let (x, y):
    print("不相等: \(x) != \(y)")
}

// ============ @unknown default ============
enum Direction {
    case north, south, east, west
    case northeast, northwest, southeast, southwest
}

func directionName(_ dir: Direction) -> String {
    switch dir {
    case .north: return "北"
    case .south: return "南"
    case .east: return "东"
    case .west: return "西"
    @unknown default:
        return "未知方向"
    }
}

print(directionName(.north))

// ============ 类型别名 ============
typealias CompletionHandler = (String) -> Void
typealias UserID = Int
typealias APIResponse = Result<String, Error>

func fetchUser(id: UserID, completion: @escaping CompletionHandler) {
    completion("User\(id)")
}

let handler: CompletionHandler = { message in
    print(message)
}
fetchUser(id: 123, completion: handler)

// ============ where 子句扩展 ============
extension Array where Element: Numeric {
    func sum() -> Element {
        return self.reduce(0, +)
    }
}

let numbers = [1, 2, 3, 4, 5]
print("数组和: \(numbers.sum())")

// ============ Any 和 AnyObject ============
var anyArray: [Any] = [1, "hello", 3.14, [1, 2, 3]]

for item in anyArray {
    switch item {
    case let int as Int:
        print("整数: \(int)")
    case let string as String:
        print("字符串: \(string)")
    case let double as Double:
        print("浮点数: \(double)")
    default:
        print("其他类型")
    }
}
