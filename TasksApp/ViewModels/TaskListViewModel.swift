//
//  TaskListViewModel.swift
//  TasksApp
//
//  Created by Efe Mazlumoğlu on 14.11.2020.
//

import Foundation
import Combine
import Resolver

class TaskListViewModel: ObservableObject {
    @Published var taskRepository: TaskRepository = Resolver.resolve()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        taskRepository.$tasks.map {
            tasks in
            tasks.map {
                task in
                TaskCellViewModel(task: task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func removeTasks(atOffsets indexSet: IndexSet) {
        let viewModels = indexSet.lazy.map {
            self.taskCellViewModels[$0]
        }
        viewModels.forEach {
            taskCellViewModel in
            taskRepository.removeTask(taskCellViewModel.task)
        }
    }
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
    }
}
