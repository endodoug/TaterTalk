//
//  NewChatViewController.swift
//  TaterTalk
//
//  Created by doug harper on 3/27/16.
//  Copyright © 2016 Doug Harper. All rights reserved.
//

import UIKit
import CoreData

class NewChatViewController: UIViewController {
    
    var context: NSManagedObjectContext?
    
    private var fetchedResultsController: NSFetchedResultsController?
    
    private let tableView = UITableView(frame: CGRectZero, style: .Plain)
    private let cellIdentifier = "ContactCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        title = "New Chat"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: .cancelButtonTapped)
        
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            tableView.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor)
        ]
        
        NSLayoutConstraint.activateConstraints(tableViewConstraints)
        
        
        if let context = context {
            let request = NSFetchRequest(entityName: "Contact")
            request.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true),
                                       NSSortDescriptor(key: "firstName", ascending: true)]
            fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: "sortLetter", cacheName: "NewChatViewController")
            
            fetchedResultsController?.delegate = self
            
            do {
                try fetchedResultsController?.performFetch()
            }
            catch {
                print("There was a problem fetching.")
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        guard let contact = fetchedResultsController?.objectAtIndexPath(indexPath) as? Contact else { return }
        cell.textLabel?.text = contact.fullName
    }

}

private extension Selector {
    static let cancelButtonTapped = #selector(NewChatViewController.cancel)
}

extension NewChatViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController?.sections else { return 0 }
        let currentSection = sections[section]
        return currentSection.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = fetchedResultsController?.sections else { return nil }
        let currentSection = sections[section]
        return currentSection.name
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}

extension NewChatViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let contact = fetchedResultsController?.objectAtIndexPath(indexPath) as? Contact else {return}
    }
    
}

extension NewChatViewController: NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        default:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Update:
            let cell = tableView.cellForRowAtIndexPath(indexPath!)
            configureCell(cell!, atIndexPath: indexPath!)
            tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}

