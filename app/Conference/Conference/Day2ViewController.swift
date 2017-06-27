//
//  DayViewController.swift
//  Conference
//
//  Created by SKIXY-MACBOOK on 29/05/17.
//  Copyright © 2017 shubhamrathi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Day2ViewController:UIViewController, IndicatorInfoProvider{
	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		self.tableView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
		self.tableView.separatorStyle = .none
		super.viewDidLoad()
	}
	func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
		return IndicatorInfo(title: "Day 2")
	}
}
extension Day2ViewController: UITableViewDelegate, UITableViewDataSource,UITableViewDataSourcePrefetching{
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
		return 5
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 30
	}
	
	func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		let header = view as! UITableViewHeaderFooterView
		header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
		header.textLabel!.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.54)
		header.backgroundView?.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
		
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Time 10:00 - 11:00 am"
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "schedule-cell-2", for: indexPath) as! ScheduleViewCell
		cell.selectionStyle = .none
		cell.view.dropShadow()
		cell.calendarButton.addTarget(self, action: #selector(self.addCalendarEntry), for: .touchUpInside)
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	 let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let objSecond = storyboard.instantiateViewController(withIdentifier: "scheduleDetails")
		navigationController?.pushViewController(objSecond, animated: true)
	}
	
	
	
	// This methods will be used for smooth scrolling.
	func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
		print("prefetchRowsAt \(indexPaths)")
	}
	
	func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
		print("cancelPrefetchingForRowsAt \(indexPaths)")
	}
	
	
	
}
