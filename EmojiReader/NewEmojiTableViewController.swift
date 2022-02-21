//
//  NewEmojiTableViewController.swift
//  EmojiReader
//
//  Created by Vitaly Khryapin on 03.11.2021.
//

import UIKit

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavorite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButton()
        updateUI()
    }
    private func updateSaveButton() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI() {
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavorite: self.emoji.isFavorite)
        
    }
    
}
