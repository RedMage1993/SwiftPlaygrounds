import Foundation
import PlaygroundSupport

class SerialAsyncTestSingleStep {
    var value = false

    func touchTheResource(task: Int) {
        print("task \(task) - \(value.sauce)")
        value.toggle()
    }

    func scheduleAsyncTask(delay: TimeInterval = 0.0, task: Int, playDirty: Bool = false) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            self.touchTheResource(task: task)
        }
        
        guard playDirty else { return }
        touchTheResource(task: task)
    }
    
    func test1() {
        [0.1, 0.2, 0.3, 0.0, 0.1, 0.0].enumerated().forEach { scheduleAsyncTask(delay: $0.element, task: $0.offset) }
    }
    
    func test2() {
        [0.1, 0.2, 0.3, 0.0, 0.1, 0.0].enumerated().forEach { scheduleAsyncTask(delay: $0.element, task: $0.offset, playDirty: true) }
    }
}

class SerialAsyncTestMultiStep {
    let originalValue = [1, 2, 3, 4, 5]
    lazy var value = originalValue

    func touchTheResource(delay: TimeInterval, task: Int, name: String) {
        print("\(name) - delay \(delay) - task \(task) - \(value)")
        
        // multistep swap operation (not xor swap shh)
        let oldValAt0 = value[0]
        value[0] = value[4]
        value[4] = oldValAt0
        
        let oldValAt1 = value[1]
        value[1] = value[3]
        value[3] = oldValAt1
    }

    func scheduleAsyncTask(delay: TimeInterval = 0.0, task: Int, name: String, playDirty: Bool = false) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            self.touchTheResource(delay: delay, task: task, name: name)
        }
        
        guard playDirty else { return }
        touchTheResource(delay: delay, task: task, name: name + " - dirty")
    }
    
    func test1() {
        [0.1, 0.2, 0.3, 0.0, 0.1, 0.0].enumerated().forEach { scheduleAsyncTask(delay: $0.element, task: $0.offset, name: #function) }
    }
    
    func test2() {
        [0.1, 0.0, 0.1, 0.0, 0.1, 0.0].enumerated().forEach { scheduleAsyncTask(delay: $0.element, task: $0.offset, name: #function, playDirty: true) }
    }
}

let serialAsyncTestSingleStep = SerialAsyncTestSingleStep()
/*
 Output
 task 3 - 0
 task 5 - 1
 task 0 - 0
 task 4 - 1
 task 1 - 0
 task 2 - 1
 */
//serialAsyncTestSingleStep.test1()

/*
 Output
 task 0 - 0
 task 1 - 1
 task 2 - 0
 task 3 - 1
 task 4 - 0
 task 5 - 1
 task 3 - 0
 task 5 - 1
 task 0 - 0
 task 4 - 1
 task 1 - 0
 task 2 - 1
 */
//serialAsyncTestSingleStep.test2()

let serialAsyncTestMultiStep = SerialAsyncTestMultiStep()
/*
 Output
 test1() - task 3 - [1, 2, 3, 4, 5]
 test1() - task 5 - [5, 4, 3, 2, 1]
 test1() - task 0 - [1, 2, 3, 4, 5]
 test1() - task 4 - [5, 4, 3, 2, 1]
 test1() - task 1 - [1, 2, 3, 4, 5]
 test1() - task 2 - [5, 4, 3, 2, 1]
 */
//serialAsyncTestMultiStep.test1()

/*
 Output
 test2() - task 0 - [1, 2, 3, 4, 5]
 test2() - task 1 - [5, 4, 3, 2, 1]
 test2() - task 2 - [1, 2, 3, 4, 5]
 test2() - task 3 - [5, 4, 3, 2, 1]
 test2() - task 4 - [1, 2, 3, 4, 5]
 test2() - task 5 - [5, 4, 3, 2, 1]
 test2() - task 1 - [1, 2, 3, 4, 5]
 test2() - task 3 - [5, 4, 3, 2, 1]
 test2() - task 5 - [1, 2, 3, 4, 5]
 test2() - task 0 - [5, 4, 3, 2, 1]
 test2() - task 2 - [1, 2, 3, 4, 5]
 test2() - task 4 - [5, 4, 3, 2, 1]
 */
//serialAsyncTestMultiStep.test2()

/*
 Output
 test2() - dirty - delay 0.1 - task 0 - [1, 2, 3, 4, 5]
 test2() - dirty - delay 0.0 - task 1 - [5, 4, 3, 2, 1]
 test2() - dirty - delay 0.1 - task 2 - [1, 2, 3, 4, 5]
 test2() - dirty - delay 0.0 - task 3 - [5, 4, 3, 2, 1]
 test2() - dirty - delay 0.1 - task 4 - [1, 2, 3, 4, 5]
 test2() - dirty - delay 0.0 - task 5 - [5, 4, 3, 2, 1]
 test1() - delay 0.0 - task 3 - [1, 2, 3, 4, 5]
 test1() - delay 0.0 - task 5 - [5, 4, 3, 2, 1]
 test2() - delay 0.0 - task 1 - [1, 2, 3, 4, 5]
 test2() - delay 0.0 - task 3 - [5, 4, 3, 2, 1]
 test2() - delay 0.0 - task 5 - [1, 2, 3, 4, 5]
 test1() - delay 0.1 - task 0 - [5, 4, 3, 2, 1]
 test1() - delay 0.1 - task 4 - [1, 2, 3, 4, 5]
 test2() - delay 0.1 - task 0 - [5, 4, 3, 2, 1]
 test2() - delay 0.1 - task 2 - [1, 2, 3, 4, 5]
 test2() - delay 0.1 - task 4 - [5, 4, 3, 2, 1]
 test1() - delay 0.2 - task 1 - [1, 2, 3, 4, 5]
 test1() - delay 0.3 - task 2 - [5, 4, 3, 2, 1]
 */
serialAsyncTestMultiStep.test1()
serialAsyncTestMultiStep.test2()

PlaygroundPage.current.needsIndefiniteExecution = true

extension Bool {
    var sauce: Int { return self == true ? 1 : 0 }
}
