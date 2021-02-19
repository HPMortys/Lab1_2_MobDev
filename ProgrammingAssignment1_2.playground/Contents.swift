
import Foundation

// Частина 1

// Дано рядок у форматі "Student1 - Group1; Student2 - Group2; ..."

let studentsStr = "Дмитренко Олександр - ІП-84; Матвійчук Андрій - ІВ-83; Лесик Сергій - ІО-82; Ткаченко Ярослав - ІВ-83; Аверкова Анастасія - ІО-83; Соловйов Даніїл - ІО-83; Рахуба Вероніка - ІО-81; Кочерук Давид - ІВ-83; Лихацька Юлія - ІВ-82; Головенець Руслан - ІВ-83; Ющенко Андрій - ІО-82; Мінченко Володимир - ІП-83; Мартинюк Назар - ІО-82; Базова Лідія - ІВ-81; Снігурець Олег - ІВ-81; Роман Олександр - ІО-82; Дудка Максим - ІО-81; Кулініч Віталій - ІВ-81; Жуков Михайло - ІП-83; Грабко Михайло - ІВ-81; Іванов Володимир - ІО-81; Востриков Нікіта - ІО-82; Бондаренко Максим - ІВ-83; Скрипченко Володимир - ІВ-82; Кобук Назар - ІО-81; Дровнін Павло - ІВ-83; Тарасенко Юлія - ІО-82; Дрозд Світлана - ІВ-81; Фещенко Кирил - ІО-82; Крамар Віктор - ІО-83; Іванов Дмитро - ІВ-82"

// Завдання 1
// Заповніть словник, де:
// - ключ – назва групи
// - значення – відсортований масив студентів, які відносяться до відповідної групи

var studentsGroups: [String: [String]] = [:]

// Ваш код починається тут
var student_list = [[String]]()
for elem in studentsStr.components(separatedBy: "; "){
    student_list.append(elem.components(separatedBy: " - "))
}

for elem in student_list {
    if !studentsGroups.keys.contains(elem[1]) {
        studentsGroups[elem[1]] = [elem[0]]
    } else {
        studentsGroups[elem[1]]?.append(elem[0])
    }
}

// Ваш код закінчується тут

print("Завдання 1")
print(studentsGroups)
print()

// Дано масив з максимально можливими оцінками

let points: [Int] = [12, 12, 12, 12, 12, 12, 12, 16]


// Завдання 2
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – масив з оцінками студента (заповніть масив випадковими значеннями, використовуючи функцію `randomValue(maxValue: Int) -> Int`)

func randomValue(maxValue: Int) -> Int {
    
    switch(arc4random_uniform(6)) {
    case 1:
        return Int(ceil(Float(maxValue) * 0.7))
    case 2:
        return Int(ceil(Float(maxValue) * 0.9))
    case 3, 4, 5:
        return maxValue
    default:
        return 0
    }
}

var studentPoints: [String: [String: [Int]]] = [:]

// Ваш код починається тут

func rand_list_points() -> [Int]{
    var test_points  = [Int]()
    for elem in points{
        test_points.append(randomValue(maxValue: elem))
    }
    return test_points
}


for elem in studentsGroups{
    for student in elem.value{
        if !studentPoints.keys.contains(elem.key) {
            studentPoints[elem.key] =  [student: rand_list_points()]
        } else {
            studentPoints[elem.key]![student] = rand_list_points()
        }
    }
}

// Ваш код закінчується тут

print("Завдання 2")
print(studentPoints)
print()

// Завдання 3
// Заповніть словник, де:
// - ключ – назва групи
// - значення – словник, де:
//   - ключ – студент, який відносяться до відповідної групи
//   - значення – сума оцінок студента

var sumPoints: [String: [String: Int]] = [:]

// Ваш код починається тут

for group in studentPoints{
    for student in group.value{
        if !sumPoints.keys.contains(group.key) {
            sumPoints[group.key] =  [student.key: student.value.reduce(0, +)]
        } else {
            sumPoints[group.key]![student.key] = student.value.reduce(0, +)
        }
    }
}

// Ваш код закінчується тут

print("Завдання 3")
print(sumPoints)
print()

// Завдання 4
// Заповніть словник, де:
// - ключ – назва групи
// - значення – середня оцінка всіх студентів групи

var groupAvg: [String: Float] = [:]

// Ваш код починається тут

for group in sumPoints{
    let avgpoints = Array(group.value.values)
    let sum_avgpoints = avgpoints.reduce(0, +)
    groupAvg[group.key] = Float(sum_avgpoints) / Float(avgpoints.count)
}

// Ваш код закінчується тут

print("Завдання 4")
print(groupAvg)
print()

// Завдання 5
// Заповніть словник, де:
// - ключ – назва групи
// - значення – масив студентів, які мають >= 60 балів

var passedPerGroup: [String: [String]] = [:]

// Ваш код починається тут

for group in sumPoints{
    passedPerGroup[group.key] = Array(group.value.filter{$0.value > 60}.keys)
}

// Ваш код закінчується тут

print("Завдання 5")
print(passedPerGroup)

// Приклад виведення. Ваш результат буде відрізнятися від прикладу через використання функції random для заповнення масиву оцінок та через інші вхідні дані.
//
//Завдання 1
//["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//Завдання 2
//["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
//
//Завдання 3
//["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
//
//Завдання 4
//["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
//
//Завдання 5
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]


print("\n----------------------------------------\n")
print("My variant: \((8120%2)+1)")
class TimeDM{
    var hours, minutes, seconds: UInt?
    init(){
        self.hours = 00
        self.minutes = 00
        self.seconds = 00
    }
    
    init(hours: UInt, minutes: UInt, seconds: UInt){
        let check_timev_al = hours <= 23 && hours >= 0 && minutes <= 59  && minutes >= 0 && seconds <= 59 && seconds >= 0
        self.hours = check_timev_al ? hours: 00
        self.minutes = check_timev_al ? minutes: 00
        self.seconds = check_timev_al ? seconds: 00
    }
    
    init(Valdate: Date){
        let calendar = Calendar.current
        self.hours = UInt(calendar.component(.hour, from: Valdate))
        self.minutes = UInt(calendar.component(.minute, from: Valdate))
        self.seconds = UInt(calendar.component(.second, from: Valdate))
    }
    
    
    func create_date_value(hours: UInt, minutes: UInt, seconds: UInt) -> Date{
        let date_format = "\(String(hours)):\(String(minutes)):\(String(seconds))"
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let date_out = formatter.date(from: date_format)!
        return date_out
    }
    
    
    func calculation_(firsttime: Date, secondtime: TimeDM, temp_operation: Bool) -> TimeDM{
        let hours2 = secondtime.hours!
        let minutes2 = secondtime.minutes!
        let seconds2 = secondtime.seconds!
        let formatter = DateFormatter()
        var dateout = firsttime
        
        var sum = Int(hours2*60*60+minutes2*60+seconds2)
        sum = temp_operation ? sum : -sum
        dateout.addTimeInterval(TimeInterval(sum))
        formatter.dateFormat = "HH:mm:ss"
        let date12 = formatter.string(from: dateout)
        let dateend = date12.split(separator: ":")
        let hours: UInt = UInt(dateend[0]) ?? 00
        let minutes: UInt = UInt(dateend[1]) ?? 00
        let seconds: UInt = UInt(dateend[2]) ?? 00
        return TimeDM(hours: hours, minutes: minutes, seconds: seconds)
    }
    
    func get_12_hours_format() -> String{
        let formatter = DateFormatter()
        let dateout = create_date_value(hours: self.hours!, minutes: self.minutes!, seconds: self.seconds!)
        formatter.dateFormat = "h:mm:ss a"
        let date12 = formatter.string(from: dateout)
        return date12
    }
    
    func sum_time(secondtime: TimeDM) -> TimeDM{
        let dateout = create_date_value(hours: self.hours!, minutes: self.minutes!, seconds: self.seconds!)
        return calculation_(firsttime: dateout, secondtime: secondtime, temp_operation: true)
    }
    
    
    
    func sub_time(secondtime: TimeDM) -> TimeDM{
        let dateout = create_date_value(hours: self.hours!, minutes: self.minutes!, seconds: self.seconds!)
        return calculation_(firsttime: dateout, secondtime: secondtime, temp_operation: false)
    }
    
    
    func sum_2_times(firsttime: TimeDM, secondtime: TimeDM) -> TimeDM{
        let dateout = create_date_value(hours: firsttime.hours!, minutes: firsttime.minutes!, seconds: firsttime.seconds!)
        return calculation_(firsttime: dateout, secondtime: secondtime, temp_operation: true)
    }
    
    
    
    func sub_2_times(firsttime: TimeDM, secondtime: TimeDM) -> TimeDM{
        let dateout = create_date_value(hours: firsttime.hours!, minutes: firsttime.minutes!, seconds: firsttime.seconds!)
        return calculation_(firsttime: dateout, secondtime: secondtime, temp_operation: false)
    }
    
}


// base init
let time_base = TimeDM()
print("5a) 12 hour system(base init): ",time_base.get_12_hours_format())

// with set of values init
let objectTime1 = TimeDM(hours: 23,minutes: 59,seconds: 59)
print("5b) 12 hour system(with set of values init): ", objectTime1.get_12_hours_format())

// with Date value init
let current_ = Date()
let time_current = TimeDM(Valdate: current_)
print("5c) 12 hour system(with Date value init): ", time_current.get_12_hours_format())


var res_sum_object = objectTime1.sum_time(secondtime: TimeDM(hours: 13, minutes: 00, seconds: 01))
print("6b) sum: ", res_sum_object.get_12_hours_format())


var res_dif_object = objectTime1.sub_time(secondtime: time_current)
print("6c)difference: ", res_dif_object.get_12_hours_format())


var tempobj = TimeDM()
var res_sum_times = tempobj.sum_2_times(firsttime: time_current, secondtime: time_current)
print("7a) sum 2: ", res_sum_times.get_12_hours_format())


var res_dif_times = tempobj.sub_2_times(firsttime: TimeDM(hours: 00,minutes: 00,seconds: 00), secondtime: TimeDM(hours: 00,minutes: 00,seconds: 01))
print("7c) difference 2: ", res_dif_times.get_12_hours_format())


