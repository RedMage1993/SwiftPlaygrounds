import Foundation
import Combine
import _Concurrency
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func testAsyncTask() async {
    do {
        print("\(#function) in progress")
        try await Task.sleep(for: .seconds(3))
    } catch {
        print("oops!")
    }
}

print("starting task")

Task {
    await testAsyncTask()
    print("done")
}

print("task started")
