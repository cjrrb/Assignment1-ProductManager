//
//  main.swift
//  Assignment1
//
//  Created by Cort Reynolds-Bolan on 2026-06-05.
//

import Foundation

func menu() {
    print("Product Management System\n")
    print("1. Add Product")
    print("2. Display Products")
    print("3. Update Product")
    print("4. Delete Product")
    print("5. Sort Products")
    print("6. Exit)\n")
    
    let choice: Int = getIntInput(prompt: "Enter your choice: ")
    
    switch choice {
    case 1:
        addProduct()
    case 2:
        displayProducts()
    case 3:
        updateProduct()
    case 4:
        deleteProduct()
    case 5:
        sortProducts()
    case 6:
        print("Exiting...")
        exit(0)
    default:
        print("Invalid input. Please enter a valid number.")
        menu()
    }

}

func getIntInput(prompt: String) -> Int {
    print(prompt)
    let text: String = readLine()!
    guard let number = Int(text) else {
        print("Invalid input. Please enter a valid number.")
        return getIntInput(prompt: prompt)
    }
    
    return number
}

func getDoubleInput(prompt: String) -> Double {
    print(prompt)
    let text: String = readLine()!
    guard let number = Double(text) else {
        print("Invalid input. Please enter a valid number.")
        return getDoubleInput(prompt: prompt)
    }
    
    return number
}
