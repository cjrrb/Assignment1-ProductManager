//
//  Product.swift
//  Assignment1
//
//  Created by Cort Reynolds-Bolan on 2026-06-05.
//

import Foundation

struct Product {
    var id: Int
    var name: String
    var category: String
    var price: Double
    var quantity: Int
}

var products: [Product] = []

func addProduct() {
    var id: Int
    var name: String
    var category: String
    var price: Double
    var quantity: Int
    
    print("Add Product")
    //Get Product ID
    repeat {
        id = getIntInput(prompt: "Enter Product ID:")
        if products.contains(where: { $0.id == id }) {
            print("Product ID already exists. Please try again.")
        }
    } while products.contains(where: { $0.id == id })
    
    //Get Product Name
    repeat {
        print("Enter Product Name:")
        name = readLine()!
        if name.isEmpty {
            print("Name cannot be empty.")
        }
    } while name.isEmpty
    
    //Get Product Category
    repeat {
        print("Enter Product Category:")
        category = readLine()!
        if category.isEmpty {
            print("Category cannot be empty.")
        }
    } while category.isEmpty
    
    //Get Product Price
    repeat {
        price = getDoubleInput(prompt: "Enter Product Price:")
        if price <= 0 {
            print("Price must be greater than 0.")
        }
    } while price <= 0
    
    //Get Product Quantity
    repeat {
        quantity = getIntInput(prompt: "Enter Product Quantity:")
        if quantity < 0 {
            print("Quantity must be greater than or equal to 0.")
        }
    } while quantity < 0
    
    let product = Product(id: id, name: name, category: category, price: price, quantity: quantity)
    products.append(product)
    print("Product added.\n")
}

func displayProducts() {
    if products.isEmpty {
        print("No products available. Please add a product first")
        return
    }
    
    for product in products {
        print("ID: \(product.id)\nName: \(product.name)\nCategory: \(product.category)\nPrice: \(product.price)\nQuantity: \(product.quantity)\n")
    }
}

func updateProduct() {
    if products.isEmpty {
        print("No products available. Please add a product first")
        return
    }
    
    //Get ID to update
    var id: Int
    repeat {
        id = getIntInput(prompt: "Enter Product ID to update:")
        if !products.contains(where: { $0.id == id }) {
            print("Product ID not found. Please try again.")
        }
    } while !products.contains(where: { $0.id == id })
    
    let index = products.firstIndex(where: { $0.id == id })!
    
    //Update name
    print("Enter updated name (leave blank to skip):")
    let newName = readLine()!
    if !newName.isEmpty {
        products[index].name = newName
    }
    
    //Update category
    print("Enter updated category (leave blank to skip):")
    let newCategory = readLine()!
    if !newCategory.isEmpty {
        products[index].category = newCategory
    }
    
    //Update price
    print("Enter updated price (leave blank to skip):")
    let newPriceInput = readLine()!
    if !newPriceInput.isEmpty {
        if let newPrice = Double(newPriceInput), newPrice > 0 {
            products[index].price = newPrice
        } else {
            print("Invalid price. Price not updated.")
        }
    }
    
    //Update quantity
    print("Enter updated quantity (leave blank to skip):")
    let newQuantityInput = readLine()!
    if !newQuantityInput.isEmpty {
        if let newQuantity = Int(newQuantityInput), newQuantity >= 0 {
            products[index].quantity = newQuantity
        } else {
            print("Invalid quantity. Quantity not updated.")
        }
    }
    
    print("Product Updated.")
}

func deleteProduct() {
    if products.isEmpty {
        print("No products available. Please add a product first")
        return
    }
    
    let id = getIntInput(prompt: "Enter Product ID to delete:")
    
    if !products.contains(where: { $0.id == id }) {
        print("Product ID not found. Please try again.")
        return
    }

    products.removeAll(where: { $0.id == id })
    print("Product deleted.")
}

func sortProducts() {
    if products.isEmpty {
        print("No products available. Please add a product first")
        return
    }
    
    print("Sort products by:")
    print("1. Name")
    print("2. Category")
    print("3. Price")
    print("4. Quantity")
    
    let choice = getIntInput(prompt: "Enter choice:")
    
    switch choice {
    case 1:
        products.sort(by: { $0.name < $1.name })
    case 2:
        products.sort(by: { $0.category < $1.category })
    case 3:
        products.sort(by: { $0.price < $1.price })
    case 4:
        products.sort(by: { $0.quantity < $1.quantity})
    default:
        print("Invalid input. Please enter a valid number.")
    }
}
