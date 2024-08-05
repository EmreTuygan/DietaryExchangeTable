//
//  ViewController.swift
//  ExchangeTable
//
//  Created by Emre Tuygan on 23.05.2023.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var CalNeeded: NSTextField!
    @IBOutlet weak var weightOf: NSTextField!
    @IBOutlet weak var heightOf: NSTextField!
    @IBOutlet weak var ageOf: NSTextField!
    @IBOutlet weak var genderOf: NSSwitch!
    
    @IBOutlet weak var CHOCal: NSTextField!
    @IBOutlet weak var CHOGram: NSTextField!
    
    @IBOutlet weak var PROCal: NSTextField!
    @IBOutlet weak var PROGram: NSTextField!
    
    @IBOutlet weak var FATCal: NSTextField!
    @IBOutlet weak var FATGram: NSTextField!
    
    
    @IBOutlet weak var promin: NSTextField!
    @IBOutlet weak var promax: NSTextField!
    
    @IBOutlet weak var fatmin: NSTextField!
    @IBOutlet weak var fatmax: NSTextField!
    
    @IBOutlet weak var chomin: NSTextField!
    @IBOutlet weak var chomax: NSTextField!
    
    @IBOutlet weak var BMI: NSTextField!
    @IBOutlet weak var Benedict: NSTextField!
    @IBOutlet weak var Jear: NSTextField!
    @IBOutlet weak var Schofield: NSTextField!
    
    
    @IBOutlet weak var BreadCount: NSTextField!
    @IBOutlet weak var BreadC: NSTextField!
    @IBOutlet weak var BreadP: NSTextField!
    
    
    @IBOutlet weak var MeatCount: NSTextField!
    @IBOutlet weak var MeatPro: NSTextField!
    @IBOutlet weak var MeatF: NSTextField!
    
    
    @IBOutlet weak var MilkCount: NSTextField!
    @IBOutlet weak var MilkC: NSTextField!
    @IBOutlet weak var MilkP: NSTextField!
    @IBOutlet weak var MilkF: NSTextField!
    
    @IBOutlet weak var MilkSemiCount: NSTextField!
    @IBOutlet weak var MilkSemiC: NSTextField!
    @IBOutlet weak var MilkSemiP: NSTextField!
    @IBOutlet weak var MilkSemiF: NSTextField!
    
    @IBOutlet weak var MilkSkimmedCount: NSTextField!
    @IBOutlet weak var MilkSkimmedC: NSTextField!
    @IBOutlet weak var MilkSkimmedP: NSTextField!
    @IBOutlet weak var MilkSkimmedF: NSTextField!
    
    
    @IBOutlet weak var VegCount: NSTextField!
    @IBOutlet weak var VegC: NSTextField!
    @IBOutlet weak var VegPro: NSTextField!
    
    @IBOutlet weak var FruitCount: NSTextField!
    @IBOutlet weak var FruitC: NSTextField!
    
    @IBOutlet weak var FatF: NSTextField!
    @IBOutlet weak var FatCount: NSTextField!
    
    @IBOutlet weak var TotalC: NSTextField!
    @IBOutlet weak var TotalP: NSTextField!
    @IBOutlet weak var TotalF: NSTextField!
    
    @IBOutlet weak var CalC: NSTextField!
    @IBOutlet weak var CalP: NSTextField!
    @IBOutlet weak var CalF: NSTextField!
    @IBOutlet weak var TotalCal: NSTextField!
    
    @IBOutlet weak var LegCount: NSTextField!
    @IBOutlet weak var LegC: NSTextField!
    @IBOutlet weak var LegP: NSTextField!
    
    var weight = 0.0
    var height = 0.0
    var age = 0.0
    var gender = true
    var caloriesNeeded = 0.0
    var gramsOfEach = ["Bread": [0.0,0.0,0.0], "Meat": [0.0,0.0,0.0],"Milk": [0.0,0.0,0.0],"Veg": [0.0,0.0,0.0],"Fru": [0.0,0.0,0.0],"Fat": [0.0,0.0,0.0], "Leg": [0.0,0.0,0.0],"MilkSemi": [0.0,0.0,0.0],"MilkSkimmed": [0.0,0.0,0.0]]
    var percentOfVal = [[50.0,55.0],[15.0,20.0],[20.0,40.0]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderOf.state = .off
        genderOf.layer?.borderColor = NSColor.systemPink.cgColor
    }
    override func viewDidAppear() {
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        // Ensure height is not zero to avoid division by zero
        guard height != 0 && weight != 0 else {
            print("Error: Height must be greater than zero.")
            return 0.0
        }
        let newheight = height / 100
        // Calculate BMI using the formula
        let bmi = weight / (newheight * newheight)
        return bmi
    }
    
    func calculateHaris(weight: Double, height: Double, age: Double, gender: Bool) -> Double{
        var score = 0.0
        if(gender){
            score =  66.5 + (5*height) + (13.75*weight) - (6.76*age)
        }
        else{
            score =  655 + (1.85*height) + (9.56*weight) - (4.68*age)
        }
        
        return score
    }
    
    func calculateMiffin(weight: Double, height: Double, age: Double, gender: Bool) -> Double{
        var score = 0.0
        if(gender){
            score = (6.25*height) + (10*weight) - (4.92*age) + 5
        }
        else{
            score = (6.25*height) + (10*weight) - (4.92*age) - 161
        }
        
        return score
    }
    
    func calculateSchofield(weight: Double, height: Double, age: Double, gender: Bool) -> Double{
        
        return 0.0
    }
    
    func checkDouble(_  result: Double) -> String{
        if result.truncatingRemainder(dividingBy: 1) == 0{
            let ret = String(Int(result))
            return ret
        }
        else{
            let ret = String(result)
            return ret
        }
    }
    
    func updateMetrics(){
        print("update clled")
        // Replace these placeholder values with the actual data you want to display
        print(weight)
        print(height)
        let bmiValue = String(calculateBMI(weight: weight, height: height))
        let benedictValue = String(calculateHaris(weight: weight, height: height, age: age, gender: gender))
        let jearValue = String(calculateMiffin(weight: weight, height: height, age: age, gender: gender))
        let schofieldValue = String(calculateSchofield(weight: weight, height: height, age: age, gender: gender))
        
        // Update the text values of the NSTextField elements
        BMI.stringValue = "BMI" + bmiValue
        Benedict.stringValue = "Harris Benedict: " + benedictValue + "cal"
        Jear.stringValue = "Miffin - St.Jean: " + jearValue + "cal"
        Schofield.stringValue = "Schofield" + schofieldValue + "cal"
    }
    
    func reloadTotal(){
        
        let totalCarbs = gramsOfEach["Bread"]![0] + gramsOfEach["Meat"]![0] + gramsOfEach["Milk"]![0] + gramsOfEach["Veg"]![0] + gramsOfEach["Fru"]![0] + gramsOfEach["Fat"]![0] + gramsOfEach["Leg"]![0] + gramsOfEach["MilkSemi"]![0] + gramsOfEach["MilkSkimmed"]![0]
        TotalC.stringValue = String(totalCarbs)
        
        let totalProtein = gramsOfEach["Bread"]![1] + gramsOfEach["Meat"]![1] + gramsOfEach["Milk"]![1] + gramsOfEach["Veg"]![1] + gramsOfEach["Fru"]![1] + gramsOfEach["Fat"]![1] + gramsOfEach["Leg"]![1] + gramsOfEach["MilkSemi"]![1] + gramsOfEach["MilkSkimmed"]![1]
        TotalP.stringValue = String(totalProtein)
        
        let totalFat = gramsOfEach["Bread"]![2] + gramsOfEach["Meat"]![2] + gramsOfEach["Milk"]![2] + gramsOfEach["Veg"]![2] + gramsOfEach["Fru"]![2] + gramsOfEach["Fat"]![2] + gramsOfEach["MilkSemi"]![2] + gramsOfEach["MilkSkimmed"]![2]
        TotalF.stringValue = String(totalFat)
        
        CalC.stringValue = String(totalCarbs * 4)
        CalF.stringValue = String(totalFat * 9)
        CalP.stringValue = String(totalProtein * 4)
        
        let total = totalCarbs * 4 + totalFat * 9 + totalProtein * 4
        
        TotalCal.stringValue = "|     \(total)"
        
    }
    
    func reloadCalandGram(){
        
        let carbonCalorieLow = caloriesNeeded * percentOfVal[0][0] / 100
        let carbonCalorieHigh = caloriesNeeded * percentOfVal[0][1] / 100
        let carbonGramsLow = carbonCalorieLow / 4
        let carbonGramHigh = carbonCalorieHigh / 4
        
        let proteinCalorieLow = caloriesNeeded * percentOfVal[1][0] / 100
        let proteinCalorieHigh = caloriesNeeded * percentOfVal[1][1] / 100
        let proteinGramsLow = proteinCalorieLow / 4
        let proteinGramHigh = proteinCalorieHigh / 4
        
        let fatCalorieLow = caloriesNeeded * percentOfVal[2][0] / 100
        let fatCalorieHigh = caloriesNeeded * percentOfVal[2][1] / 100
        let fatGramsLow = fatCalorieLow / 9
        let fatGramHigh = fatCalorieHigh / 9
        
        CHOCal.stringValue = " \(round(100 * carbonCalorieLow) / 100)Cal / \(round(100 * carbonCalorieHigh) / 100)Cal "
        CHOGram.stringValue = "\(round(100 * carbonGramsLow) / 100)gr / \(round(100 * carbonGramHigh) / 100 )gr "
        
        PROCal.stringValue = "\(round(100 * proteinCalorieLow) / 100)Cal / \(round(100 * proteinCalorieHigh) / 100)Cal "
        PROGram.stringValue = "\(round(100 * proteinGramsLow) / 100)gr / \(round(100 * proteinGramHigh) / 100)gr "
        
        
        FATCal.stringValue = "\(round(100 * fatCalorieLow) / 100)Cal / \(round(100 * fatCalorieHigh) / 100)Cal "
        FATGram.stringValue = "\(round(100 * fatGramsLow) / 100)gr / \(round(100 * fatGramHigh) / 100)gr "
        
    }
    
    
    
    @IBAction func gender(_ sender: NSSwitch) {
        if sender.state == .on {
            gender = true
            genderOf.layer?.borderColor = NSColor.blue.cgColor
        }
        else {
            gender = false
            genderOf.layer?.borderColor = NSColor.systemPink.cgColor
        }
        updateMetrics()
    }
    
    @IBAction func kg(_ sender: Any) {
        weight = Double(weightOf.stringValue) ?? 0
        updateMetrics()
        
    }
    @IBAction func cm(_ sender: Any) {
        height = Double(heightOf.stringValue) ?? 0
        updateMetrics()
    }
    @IBAction func yo(_ sender: Any) {
        age = Double(ageOf.stringValue) ?? 0
        updateMetrics()
    }
    
    
    @IBAction func CaloriesNeeded(_ sender: Any) {
        
        caloriesNeeded = Double(CalNeeded.stringValue) ?? 0
        reloadCalandGram()

    }
    
    @IBAction func CHOmin(_ sender: Any) {
        percentOfVal[0][0] = Double(chomin.stringValue) ?? 0
        reloadCalandGram()
    }
    
    
    @IBAction func CHOMax(_ sender: Any) {
        percentOfVal[0][1] = Double(chomax.stringValue) ?? 0
        reloadCalandGram()
    }
    
    @IBAction func PROMin(_ sender: Any) {
        percentOfVal[1][0] = Double(promin.stringValue) ?? 0
        reloadCalandGram()
        
    }
    
    @IBAction func PROMax(_ sender: Any) {
        percentOfVal[1][1] = Double(promax.stringValue) ?? 0
        reloadCalandGram()
    }
    
    @IBAction func FATMin(_ sender: Any) {
        percentOfVal[2][0] = Double(fatmin.stringValue) ?? 0
        reloadCalandGram()
    }
    
    @IBAction func FATMax(_ sender: Any) {
        percentOfVal[2][1] = Double(fatmax.stringValue) ?? 0
        reloadCalandGram()
    }
    
    
    @IBAction func BreadPortion(_ sender: Any) {
        let portion = Double(BreadCount.stringValue) ?? 0
        gramsOfEach["Bread"]![0] = portion * 15
        gramsOfEach["Bread"]![1] = portion * 2
        BreadC.stringValue = checkDouble(portion * 15)
        BreadP.stringValue = checkDouble(portion * 2)
        reloadTotal()
    }
    
    @IBAction func MeatPortion(_ sender: Any) {
        let portion = Double(MeatCount.stringValue) ?? 0
        gramsOfEach["Meat"]![1] = portion * 6
        gramsOfEach["Meat"]![2] = portion * 5
        MeatPro.stringValue = checkDouble(portion * 6)
        MeatF.stringValue = checkDouble(portion * 5)
        reloadTotal()
    }
    
    @IBAction func MilkPortion(_ sender: Any) {
        let portion = Double(MilkCount.stringValue) ?? 0
        gramsOfEach["Milk"]![0] = portion * 9
        gramsOfEach["Milk"]![1] = portion * 6
        gramsOfEach["Milk"]![2] = portion * 6
        MilkC.stringValue = checkDouble(portion * 9)
        MilkP.stringValue = checkDouble(portion * 6)
        MilkF.stringValue = checkDouble(portion * 6)
        reloadTotal()
    }
    
    @IBAction func VegPortion(_ sender: Any) {
        let portion = Double(VegCount.stringValue) ?? 0
        gramsOfEach["Veg"]![0] = portion * 6
        gramsOfEach["Veg"]![1] = portion * 1
        VegC.stringValue = checkDouble(portion * 6)
        VegPro.stringValue = checkDouble(portion * 1)
        reloadTotal()
    }
    
    @IBAction func FruPortion(_ sender: Any) {
        let portion = Double(FruitCount.stringValue) ?? 0
        gramsOfEach["Fru"]![0] = portion * 15
        FruitC.stringValue = checkDouble(portion * 15)
        reloadTotal()
    }
    
    @IBAction func FatPortion(_ sender: Any) {
        let portion = Double(FatCount.stringValue) ?? 0
        gramsOfEach["Fat"]![2] = portion * 5
        FatF.stringValue = checkDouble(portion * 5)
        reloadTotal()
    }
    
    @IBAction func LegPortion(_ sender: Any) {
        let portion = Double(LegCount.stringValue) ?? 0
        gramsOfEach["Leg"]![0] = portion * 15
        gramsOfEach["Leg"]![1] = portion * 5
        LegC.stringValue = checkDouble(portion * 15)
        LegP.stringValue = checkDouble(portion * 5)
        reloadTotal()
    }
    
    @IBAction func MilkSemiPortion(_ sender: Any) {
        let portion = Double(MilkSemiCount.stringValue) ?? 0
        gramsOfEach["MilkSemi"]![0] = portion * 9
        gramsOfEach["MilkSemi"]![1] = portion * 6
        gramsOfEach["MilkSemi"]![2] = portion * 3
        MilkSemiC.stringValue = checkDouble(portion * 9)
        MilkSemiP.stringValue = checkDouble(portion * 6)
        MilkSemiF.stringValue = checkDouble(portion * 3)
        reloadTotal()
    }
    
    
    @IBAction func MilkSkimmedPortion(_ sender: Any) {
        let portion = Double(MilkSkimmedCount.stringValue) ?? 0
        gramsOfEach["MilkSkimmed"]![0] = portion * 9
        gramsOfEach["MilkSkimmed"]![1] = portion * 6
        gramsOfEach["MilkSkimmed"]![2] = portion * 0
        MilkSkimmedC.stringValue = checkDouble(portion * 9)
        MilkSkimmedP.stringValue = checkDouble(portion * 6)
        MilkSkimmedF.stringValue = checkDouble(portion * 0)
        reloadTotal()
    }
    
}

