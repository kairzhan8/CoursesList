//
//  CoursesListTableViewController.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

protocol CourseListViewProtocol: class {
    var selfToCourseDetailsSegueName: String { get }
    func reloadData()
}

class CoursesListTableViewController: UITableViewController {
    
    var presenter: CourseListPresenterProtocol!
    
    var selfToCourseDetailsSegueName = "showDetails"
    
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == selfToCourseDetailsSegueName {
            guard let course = sender as? Course else { return }
            let detailsVC = segue.destination as! CourseDetailsViewController
            let configurator: CourseDetailsConfiguratorProtocol = CourseDetailsConfigurator()
            configurator.configure(with: detailsVC, and: course)
        }
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.coursesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseTableViewCell
        guard let course = presenter.course(at: indexPath) else { return UITableViewCell()}
        cell.configure(course: course)
        return cell
    }
    
    // MARK: - Table veiw delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showCourseDetails(for: indexPath)
    }


}
// MARK: - CourseListViewProtocol
extension CoursesListTableViewController: CourseListViewProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

