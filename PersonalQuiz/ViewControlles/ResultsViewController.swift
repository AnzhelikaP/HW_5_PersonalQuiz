//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    @IBOutlet var allAnswersLabel: UILabel!
    // Создана переменная для массива ответов. В эту переменную переносится результат с экрана вопросов
    var arraysAnimal: [Answer] = []
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var allAnswers = ""
        // С помощью функции определяем результирующий ответ - тип животного и присваиваем его константе
        let youAnimal = printType()
        // Создаем строку ответов с эмодзи из переданного с экрана ответов массива
        for animal in arraysAnimal {
                allAnswers += "\(animal.text) \(animal.type.rawValue)."
            }
        // Выводим результат - тип животного
        resultAnimalLabel.text = "Вы - \(youAnimal.rawValue)!"
        // Выводим описание результата (берем из описания типа животного)
        descriptionAnimalLabel.text =  youAnimal.definition
        // Выводим все ответы с эмодзи
        allAnswersLabel.text = "Твои ответы: \(allAnswers)"
        // скрываем кнопку Back
        navigationItem.hidesBackButton = true
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
}

extension ResultsViewController {
    func printType() -> AnimalType {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = arraysAnimal.map { $0.type }
        for animal in animals {
               frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
           }
           
           let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        return sortedFrequencyOfAnimals.first?.key ?? AnimalType.dog
        
        
     /*   // создаем словарь, где ключ - тип животного,
        // значение - кол-во ответов для этого типа
        var resultsDict = [AnimalType.dog: 0,
                           AnimalType.cat: 0,
                           AnimalType.turtle: 0,
                           AnimalType.rabbit: 0]
        
        for animal in arraysAnimal {
            resultsDict [animal.type]! += 1
        }
        // сортируем словарь по значению
        let resultsDictSorted = resultsDict.sorted(by: { $0.value > $1.value })
        // print("\(resultsDictSorted)")
        // выводим первый ключ - тип животного
        return resultsDictSorted.first?.key ?? AnimalType.dog */

    }
    
    
} 
