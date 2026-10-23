# Swift GCD Dispatch Group Lab

A Swift learning exercise focused on Grand Central Dispatch (GCD), asynchronous task execution, and coordinating concurrent operations with `DispatchGroup`.

## 🎯 Objective

Learn how to execute multiple tasks concurrently using GCD and ensure that all tasks have completed before proceeding to the final step.

## 🧠 Concepts Covered

- **Grand Central Dispatch (GCD)** — Apple's concurrency framework for scheduling work.
- **`DispatchQueue`** — Schedules tasks for execution.
- **Global concurrent queues** — Allow multiple tasks to execute concurrently.
- **`async`** — Submits work without waiting for it to finish.
- **`DispatchGroup`** — Tracks a collection of tasks and coordinates their completion.
- **`enter()` and `leave()`** — Manually manage the group's pending task count.
- **`wait()`** — Blocks the current thread until all registered tasks finish.
- **Completion handlers** — Execute additional logic when an individual task completes.

## ⚙️ How It Works

The program simulates three data requests from different API sources:

```swift
let sources = ["API 1", "API 2", "API 3"]
```

Each task is submitted to a global concurrent queue:

```swift
queue.async {
    // Fetch and process data
}
```

The `fetchData(from:completion:)` function simulates a network delay using `sleep(2)`, prints the result, and invokes its completion handler.

A `DispatchGroup` coordinates the tasks:

1. `group.enter()` registers a pending task before it is submitted.
2. `group.leave()` marks the task as completed.
3. `group.wait()` blocks the current thread until every registered task has finished.
4. The final message is printed only after the group has completed.

## 🛠️ Technologies

- Swift
- Foundation
- Grand Central Dispatch (GCD)
- Xcode

## 🚀 How to Run

1. Clone or download this repository.
2. Open the project in Xcode.
3. If using a Command Line Tool project, place the source code in `main.swift`.
4. Run the program and inspect the console output.

## 📂 Project Structure

```text
swift-gcd-dispatch-group-lab/
├── GCDDispatchGroupLab/
│   └── main.swift
└── README.md
```

## 📋 Expected Output

The order of messages may vary because the tasks execute concurrently. A possible output is:

```text
API 1 - Fetching data...
API 2 - Fetching data...
API 3 - Fetching data...
All tasks started...
API 2 = Data fetched
API 2 - Processing complete
API 1 = Data fetched
API 1 - Processing complete
API 3 = Data fetched
API 3 - Processing complete
All task finished :)
```

The output above is illustrative; the exact ordering is not guaranteed.

The important behavior is that the final message, `All task finished :)`, appears only after all three tasks have completed.

## 📚 Key Takeaway

`DispatchQueue.global().async` allows tasks to be scheduled without blocking the submitting thread. `DispatchGroup` provides a mechanism to coordinate those tasks and determine when the entire group has finished.

In this command-line exercise, `group.wait()` ensures the program does not proceed to the final message until every registered task is complete.

In a UIKit application, avoid blocking the main thread with `wait()` when updating the interface. Prefer `group.notify(queue: .main)` to perform UI updates after all tasks have finished.

---

**Project type:** Swift learning exercise  
**Focus:** GCD, concurrent execution, asynchronous programming, and task synchronization
