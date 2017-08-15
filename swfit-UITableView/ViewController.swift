//
//  ViewController.swift
//  swfit-UITableView
//
//  Created by 吉祥 on 2017/8/14.
//  Copyright © 2017年 jixiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    //MARK: 控件区
    @IBOutlet weak var tableView: UITableView!
    //MARK: cell 标识符
    fileprivate let cellId = "GGgirlsID"
    var ctrNames:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        //初始化数据源
        loadData()
        //调用table方法
        makeTable()
    }
    
    //初始化数据源
    func loadData(){
        ctrNames = ["1A","2B","3C","4D","5E","6F","7G","8H","9I","10J"]
        self.tableView .reloadData()
    }
    
    //创建tableView
    func makeTable(){
        //设置cell分割线是否显示
        //self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.delegate = self//实现代理
        self.tableView.dataSource = self//实现数据源
        //nib
        self.tableView.register(UINib(nibName: "GGirlsCell", bundle: nil), forCellReuseIdentifier: cellId)
        //去除tableView 多余行的方法 添加一个tableFooterView 后面多余行不再显示
        self.tableView.tableFooterView = UIView()
    }
    
    //MARK: 数据源
    //cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.ctrNames!.count
    }
    
    //tablViewCell 高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 100.0;
    }
    
    /*
     //头部高度
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 0.01
     }
     
     //底部高度
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     return 0.01
     }
     */
    
    //cell赋值
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // Nib注册, 调用的时候会调用自定义cell中的  awakeFromNib  方法
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! GGirlsCell
        cell.girlImage.image = UIImage(named: "\(indexPath.row).jpg")
        cell.titleLabel?.text = ctrNames![indexPath.row] as? String
        return cell
    }
    
    //cell点击事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        print(ctrNames![indexPath.row])
    }
    
    //cell填满屏幕
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to:#selector(setter: UIView.layoutMargins)) {
            cell.layoutMargins = UIEdgeInsets.zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = UIEdgeInsets.zero
        }
    }
    
    //允许编辑cell
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //右滑触发删除按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.init(rawValue: 1)!
    }
    
    //点击删除cell时触发
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("indexPath.row = editingStyle第\(indexPath.row)行")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

