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
    print("Enter Product ID:")
    let id: Int = Int(readLine()!)!
    if products.contains(where: { $0.id == id }) {
        print("Product ID already exists. Please try again.")
        return
    }
    
    print("Enter Product Name:")
    let name: String = readLine()!
    if name.isEmpty {
        print("Name cannot be empty.")
        return
    }
    
    print("Enter Product Category:")
    let category: String = readLine()!
    if category.isEmpty {
        print("Category cannot be empty.")
        return
    }
    
    print("Enter price:")
    let price: Double = Double(readLine()!)!
    if price <= 0 {
        print("Price must be greater than 0.")
        return
    }
    
    print("Enter quantity:")
    let quantity: Int = Int(readLine()!)!
    if quantity < 0 {
        print("Quantity must be greater than or equal to 0.")
        return
    }
    
    let product = Product(id: id, name: name, category: category, price: price, quantity: quantity)
    products.append(product)
}

func displayProducts() {
    for product in products {
        if products.isEmpty {
            print("No products available. Please add a product first")
            return
        }
        print("ID: \(product.id)\nName: \(product.name)\nCategory: \(product.category)\nPrice: \(product.price)\nQuantity: \(product.quantity)\n")
    }
}

func updateProduct() {
    
}

func deleteProduct() {
    
}

func sortProducts() {
    
}
