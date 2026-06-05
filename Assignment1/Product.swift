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
    var id: Int
    var updatedName: String
    var updatedCategory: String
    var updatedPrice: Double
    var updatedQuantity: Int
    
    repeat {
        id = getIntInput(prompt: "Enter Product ID to update:")
        if !products.contains(where: { $0.id == id }) {
            print("Product ID not found. Please try again.")
        }
    } while !products.contains(where: { $0.id == id })
    
    print("Enter updated name (leave blank to skip):")
    if let updatedName = readLine(), !updatedName.isEmpty {
        products.first(where: { $0.id == id })!.name = updatedName
    } else {

    }
    
}

func deleteProduct() {
    var id: Int
    
    repeat {
        id = getIntInput(prompt: "Enter Product ID to delete:")
        if !products.contains(where: { $0.id == id }) {
            print("Product ID not found. Please try again.")
        }
    } while !products.contains(where: { $0.id == id })
    
    products.removeAll(where: { $0.id == id })
    print("Product deleted.")
}

func sortProducts() {
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
