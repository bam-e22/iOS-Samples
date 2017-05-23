import UIKit

class ViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    let view4 = UIView()
    
    let view5 = UIView()
    let view6 = UIView()
    let view7 = UIView()
    let view8 = UIView()
    let view9 = UIView()
    let view10 = UIView()
    let view11 = UIView()
    let view12 = UIView()
    let view13 = UIView()
    let view14 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        
        setLayout()
        setDetailLayout()
        setLastLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setLayout() -> Void {
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = UIColor.black
        view1.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        view1.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = UIColor.blue
        view2.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        view2.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor).isActive = true
        
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.backgroundColor = UIColor.brown
        view3.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.3).isActive = true
        view3.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view3.topAnchor.constraint(equalTo: view2.bottomAnchor).isActive = true
        
        view4.translatesAutoresizingMaskIntoConstraints = false
        view4.backgroundColor = UIColor.purple
        view4.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.1).isActive = true
        view4.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        view4.topAnchor.constraint(equalTo: view3.bottomAnchor).isActive = true
    }
    
    func setDetailLayout() -> Void {
        
        // view1
        view1.addSubview(view5)
        view1.addSubview(view6)
        
        view5.translatesAutoresizingMaskIntoConstraints = false
        view5.backgroundColor = UIColor.cyan
        view5.heightAnchor.constraint(equalTo: view1.heightAnchor).isActive = true
        view5.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        
        view6.translatesAutoresizingMaskIntoConstraints = false
        view6.backgroundColor = UIColor.orange
        view6.heightAnchor.constraint(equalTo: view1.heightAnchor).isActive = true
        view6.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view6.leftAnchor.constraint(equalTo: view5.rightAnchor).isActive = true
        
        // view2
        view2.addSubview(view7)
        view2.addSubview(view8)
        
        view7.translatesAutoresizingMaskIntoConstraints = false
        view7.backgroundColor = UIColor.darkGray
        view7.heightAnchor.constraint(equalTo: view2.heightAnchor).isActive = true
        view7.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view7.topAnchor.constraint(equalTo: view5.bottomAnchor).isActive = true
        
        view8.translatesAutoresizingMaskIntoConstraints = false
        view8.backgroundColor = UIColor.green
        view8.heightAnchor.constraint(equalTo: view2.heightAnchor).isActive = true
        view8.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view8.leftAnchor.constraint(equalTo: view7.rightAnchor).isActive = true
        view8.topAnchor.constraint(equalTo: view6.bottomAnchor).isActive = true
        
        // view3
        view3.addSubview(view9)
        view3.addSubview(view10)
        
        view9.translatesAutoresizingMaskIntoConstraints = false
        view9.backgroundColor = UIColor.red
        view9.heightAnchor.constraint(equalTo: view3.heightAnchor).isActive = true
        view9.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view9.topAnchor.constraint(equalTo: view7.bottomAnchor).isActive = true
        
        view10.translatesAutoresizingMaskIntoConstraints = false
        view10.backgroundColor = UIColor.magenta
        view10.heightAnchor.constraint(equalTo: view2.heightAnchor).isActive = true
        view10.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 2).isActive = true
        view10.leftAnchor.constraint(equalTo: view9.rightAnchor).isActive = true
        view10.topAnchor.constraint(equalTo: view8.bottomAnchor).isActive = true
    }
    
    func setLastLayout() -> Void {
        
        view4.addSubview(view11)
        view4.addSubview(view12)
        view4.addSubview(view13)
        view4.addSubview(view14)
        
        view11.translatesAutoresizingMaskIntoConstraints = false
        view11.backgroundColor = UIColor.lightGray
        view11.heightAnchor.constraint(equalTo: view4.heightAnchor).isActive = true
        view11.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 4).isActive = true
        view11.topAnchor.constraint(equalTo: view9.bottomAnchor).isActive = true
        
        view12.translatesAutoresizingMaskIntoConstraints = false
        view12.backgroundColor = UIColor.yellow
        view12.heightAnchor.constraint(equalTo: view4.heightAnchor).isActive = true
        view12.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 4).isActive = true
        view12.topAnchor.constraint(equalTo: view9.bottomAnchor).isActive = true
        view12.leftAnchor.constraint(equalTo: view11.rightAnchor).isActive = true
        
        
        view13.translatesAutoresizingMaskIntoConstraints = false
        view13.backgroundColor = UIColor.white
        view13.heightAnchor.constraint(equalTo: view4.heightAnchor).isActive = true
        view13.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 4).isActive = true
        view13.topAnchor.constraint(equalTo: view10.bottomAnchor).isActive = true
        view13.leftAnchor.constraint(equalTo: view12.rightAnchor).isActive = true
        
        
        view14.translatesAutoresizingMaskIntoConstraints = false
        view14.backgroundColor = UIColor.blue
        view14.heightAnchor.constraint(equalTo: view4.heightAnchor).isActive = true
        view14.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 4).isActive = true
        view14.topAnchor.constraint(equalTo: view10.bottomAnchor).isActive = true
        view14.leftAnchor.constraint(equalTo: view13.rightAnchor).isActive = true
    }
}

