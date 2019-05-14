//
//  FinalRegistroViewController.swift
//  GS Sales SIM
//
//  Created by Paola Garzón on 4/8/19.
//  Copyright © 2019 Paola Garzón. All rights reserved.
//

import UIKit
import Charts
import MessageUI

var imagenRadarChartFinal: UIImage!
var imagenBarChartFinal: UIImage!

class FinalRegistroViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var radarChart: RadarChartView!
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var calificacionUsuario: UILabel!
    var valorCalUsuario: Int = 0

    var GeneralC1 = 0.0
    var GeneralC2 = 0.0
    var GeneralC3 = 0.0
    var GeneralC4 = 0.0
    
    //valores para grafica de radar
    let nombresRadarChart = ["C1", "C2", "C3", "C4"]

    //valores para grafica de barras
    let nombresBarChart = ["C1A1", "C1A2", "C1A3", "C1A4", "C1A5", "C1A6", "C1B1", "C1B2", "C1B3", "C1B4", "C1C1", "C1C2", "C1C3", "C1C4", "C1C5", "C1C6", "C1C7", "C1C8", "C2A1", "C2A2", "C2A3", "C2A4", "C2A5", "C2B1", "C2B2", "C2B3", "C2B4", "C2C1", "C2C2", "C2C3", "C3A1", "C3A2", "C3A3", "C3B1", "C3B2", "C3B3", "C3B4", "C3B5", "C3C1", "C3D1", "C3D2", "C3D3", "C3D4", "C3E1", "C3E2", "C3E3", "C3E4", "C3E5", "C3E6", "C3E7", "C4A1", "C4A2", "C4A3", "C4A4", "C4A5", "C4A6", "C4A7", "C4A8", "C4A9"]
    let valoresBarChart = [valoresBarChartC1[0], valoresBarChartC1[1], valoresBarChartC1[2], valoresBarChartC1[3], valoresBarChartC1[4], valoresBarChartC1[5], valoresBarChartC1[6], valoresBarChartC1[7], valoresBarChartC1[8], valoresBarChartC1[9], valoresBarChartC1[10], valoresBarChartC1[11], valoresBarChartC1[12], valoresBarChartC1[13], valoresBarChartC1[14], valoresBarChartC1[15], valoresBarChartC1[16], valoresBarChartC1[17], valoresBarChartC2[0], valoresBarChartC2[1], valoresBarChartC2[2], valoresBarChartC2[3], valoresBarChartC2[4], valoresBarChartC2[5], valoresBarChartC2[6], valoresBarChartC2[7], valoresBarChartC2[8], valoresBarChartC2[9], valoresBarChartC2[10], valoresBarChartC2[11], valoresBarChartC3[0], valoresBarChartC3[1], valoresBarChartC3[2], valoresBarChartC3[3], valoresBarChartC3[4], valoresBarChartC3[5], valoresBarChartC3[6], valoresBarChartC3[7], valoresBarChartC3[8], valoresBarChartC3[9], valoresBarChartC3[10], valoresBarChartC3[11], valoresBarChartC3[12], valoresBarChartC3[13], valoresBarChartC3[14], valoresBarChartC3[15], valoresBarChartC3[16], valoresBarChartC3[17], valoresBarChartC3[18], valoresBarChartC3[19], valoresBarChartC4[0], valoresBarChartC4[1], valoresBarChartC4[2], valoresBarChartC4[3], valoresBarChartC4[4], valoresBarChartC4[5], valoresBarChartC4[6], valoresBarChartC4[7], valoresBarChartC4[8]]
    
    let valoresBonos = [bonoC1[0], bonoC1[1], bonoC1[2], bonoC1[3], bonoC1[4], bonoC1[5], bonoC1[6], bonoC1[7], bonoC1[8], bonoC1[9], bonoC1[10], bonoC1[11], bonoC1[12], bonoC1[13], bonoC1[14], bonoC1[15], bonoC1[16], bonoC1[17], bonoC2[0], bonoC2[1], bonoC2[2], bonoC2[3], bonoC2[4], bonoC2[5], bonoC2[6], bonoC2[7], bonoC2[8], bonoC2[9], bonoC2[10], bonoC2[11], bonoC3[0], bonoC3[1], bonoC3[2], bonoC3[3], bonoC3[4], bonoC3[5], bonoC3[6], bonoC3[7], bonoC3[8], bonoC3[9], bonoC3[10], bonoC3[11], bonoC3[12], bonoC3[13], bonoC3[14], bonoC3[15], bonoC3[16], bonoC3[17], bonoC3[18], bonoC3[19], bonoC4[0], bonoC4[1], bonoC4[2], bonoC4[3], bonoC4[4], bonoC4[5], bonoC4[6], bonoC4[7], bonoC4[8]]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    var outputURL: URL! = nil
    
    //IMAGENES DE LOS CUADRANTES PARA PDF
    var arrayImg: [UIImage]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(valorGeneralC1 > 0){
            GeneralC1 = Double(valorGeneralC1)
        }
        if(valorGeneralC2 > 0){
            GeneralC2 = Double(valorGeneralC2)
        }
        if(valorGeneralC3 > 0){
            GeneralC3 = Double(valorGeneralC3)
        }
        if(valorGeneralC4 > 0){
            GeneralC4 = Double(valorGeneralC4)
        }
        
        let valoresRadarChart = [GeneralC1, GeneralC2, GeneralC3, GeneralC4]
        
        valorCalUsuario = Int(((GeneralC1 + GeneralC2 + GeneralC3 + GeneralC4) / 4))
        
        calificacionUsuario.text = ("Cal. Usuario: " + String(valorCalUsuario) + "%")
        
        setRadarChart(dataPoints: nombresRadarChart, values: valoresRadarChart)
        let  xAxis : XAxis = self.radarChart.xAxis
        xAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 16.0)!
        let  yAxis : YAxis = self.radarChart.yAxis
        yAxis.labelFont = UIFont(name: "Arial-BoldMT", size: 10.0)!
        
        axisFormatDelegate = self as? IAxisValueFormatter
        setBarChart(dataPoints: nombresBarChart, values: valoresBarChart, values2: valoresBonos, sortIndex: 0)
        
    }
    
    //ENVIAR CORREO
    @IBAction func enviarCorreo(_ sender: Any) {
        
        imagenRadarChartFinal = barChart.asImage()
        imagenBarChartFinal = radarChart.asImage()
        
        arrayImg = [imagenBarChartC1!, imagenRadarChartC1!, imagenBarChartC2!, imagenRadarChartC2!, imagenBarChartC3!, imagenRadarChartC3!, imagenBarChartC4!, imagenBarChartFinal!, imagenRadarChartFinal!]
        
        pdf(image: arrayImg)
        
        let data = try! Data(contentsOf: outputURL)
        sendEmail(data:data)
    }
    
    func sendEmail(data:Data?){
        if( MFMailComposeViewController.canSendMail() ) {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            
            mailComposer.setToRecipients(["mcolinaarroyo@graphisoft.com"])
            mailComposer.setSubject("PDF")
            mailComposer.setMessageBody("", isHTML: true)
            
            if let fileData = data {
                mailComposer.addAttachmentData(fileData, mimeType: "application/pdf", fileName: "PDF.pdf")
            }
            
            
            self.present(mailComposer, animated: true, completion: nil)
            return
        }
        print("Email is not configured")
        
    }
    
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        self.dismiss(animated: true, completion: nil)
        print("sent!")
    }
    
    //CREACION DEL PDF
    func pdf(image: [UIImage]){
        
        let html = "<br><br><b>&nbsp;&nbsp;RFC: </b>\(textoRFC)<br><hr><br>&nbsp;&nbsp;&nbsp;&nbsp; 1er Cuadrante<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp; 2do Cuadrante"
        let fmt = UIMarkupTextPrintFormatter(markupText: html)
        
        // 2. Assign print formatter to UIPrintPageRenderer
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        
        let html2 = "<br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp; 3er Cuadrante<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp; 4to Cuadrante"
        let fmt2 = UIMarkupTextPrintFormatter(markupText: html2)
        render.addPrintFormatter(fmt2, startingAtPageAt: 1)
        
        
        let html3 = "<br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp; Calificación Final"
        let fmt3 = UIMarkupTextPrintFormatter(markupText: html3)
        render.addPrintFormatter(fmt3, startingAtPageAt: 2)
        
        
        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")
        
        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        let pdfContext = UIGraphicsGetCurrentContext()
        
        let mediaBox1 = CGRect(x: 50, y: 100, width: 250, height: 300) //1
        let mediaBox2 = CGRect(x: 320, y: 100, width: 250, height: 300)
        let mediaBox3 = CGRect(x: 50, y: 450, width: 250, height: 300) //2
        let mediaBox4 = CGRect(x: 320, y: 450, width: 250, height: 300)
        let mediaBox5 = CGRect(x: 50, y: 100, width: 250, height: 300)//3
        let mediaBox6 = CGRect(x: 320, y: 100, width: 250, height: 300)
        let mediaBox7 = CGRect(x: 50, y: 450, width: 250, height: 300) //4
        let mediaBox8 = CGRect(x: 185, y: 100, width: 250, height: 300) //Final
        let mediaBox9 = CGRect(x: 70, y: 450, width: 500, height: 300)

        let im1: UIImage = flipImageVertically(originalImage: image[0])
        let im2: UIImage = flipImageVertically(originalImage: image[1])
        let im3: UIImage = flipImageVertically(originalImage: image[2])
        let im4: UIImage = flipImageVertically(originalImage: image[3])
        let im5: UIImage = flipImageVertically(originalImage: image[4])
        let im6: UIImage = flipImageVertically(originalImage: image[5])
        let im7: UIImage = flipImageVertically(originalImage: image[6])
        let im8: UIImage = flipImageVertically(originalImage: image[7])
        let im9: UIImage = flipImageVertically(originalImage: image[8])

        let rotatedImage1 = im1.rotate(radians: .pi/2)
        let rotatedImage2 = im2.rotate(radians: .pi/2)
        let rotatedImage3 = im3.rotate(radians: .pi/2)
        let rotatedImage4 = im4.rotate(radians: .pi/2)
        let rotatedImage5 = im5.rotate(radians: .pi/2)
        let rotatedImage6 = im6.rotate(radians: .pi/2)
        let rotatedImage7 = im7.rotate(radians: .pi/2)
        let rotatedImage8 = im8.rotate(radians: .pi/2)
        let rotatedImage9 = im9.rotate(radians: .pi/2)

        for i in 0..<3 {
            UIGraphicsBeginPDFPage();
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
            if(i==0){
                pdfContext!.draw(rotatedImage1.cgImage!, in: mediaBox1)
                pdfContext!.draw(rotatedImage2.cgImage!, in: mediaBox2)
                pdfContext!.draw(rotatedImage3.cgImage!, in: mediaBox3)
                pdfContext!.draw(rotatedImage4.cgImage!, in: mediaBox4)
            } else if (i == 1){
                pdfContext!.draw(rotatedImage5.cgImage!, in: mediaBox5)
                pdfContext!.draw(rotatedImage6.cgImage!, in: mediaBox6)
                pdfContext!.draw(rotatedImage7.cgImage!, in: mediaBox7)
            } else if(i == 2){
                pdfContext!.draw(rotatedImage8.cgImage!, in: mediaBox8)
                pdfContext!.draw(rotatedImage9.cgImage!, in: mediaBox9)
            }
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        outputURL = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
        outputURL = outputURL.appendingPathComponent("output.pdf") as URL
        
        pdfData.write(to: outputURL, atomically: true)
        print("open \(outputURL.path)") // command to open the generated file
    }
    
    func flipImageVertically(originalImage:UIImage) -> UIImage {
        let image:UIImage = UIImage(cgImage: originalImage.cgImage!, scale: 1.0, orientation: UIImage.Orientation.rightMirrored)
        return image
    }
    
    
    //Funcion de la radarChart
    func setRadarChart(dataPoints: [String], values: [Double]) {
        
        let numAprobatorio = [60.0, 55.0, 43.0, 62.0]
        
        //set de los numeros aprobatorios
        var dataEntriesA: [ChartDataEntry] = []
        for i in 0..<numAprobatorio.count {
            let dataEntryA = ChartDataEntry(x: Double(i), y: numAprobatorio[i])
            dataEntriesA.append(dataEntryA)
        }
        let chartDataSetA = RadarChartDataSet(values: dataEntriesA, label: "Número aprobatorio         ")
        chartDataSetA.setColor(.blue)
        
        //set de los numeros que saca el usuario
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let chartDataSet = RadarChartDataSet(values: dataEntries, label: "Calificación")
        
        //Options of radarChart
        radarChart.sizeToFit()
        radarChart.setExtraOffsets(left: 0, top: 10, right: 0, bottom: 0)
        radarChart.chartDescription?.text = nil
        radarChart.legend.horizontalAlignment = .center
        
        //Options for the axis from here. The range is 0-100, the interval is 10
        radarChart.yAxis.forceLabelsEnabled = true
        //radarChart.yAxis.labelCount = 10
        radarChart.yAxis.axisMinimum = 0.0
        radarChart.yAxis.axisMaximum = 150.0
        radarChart.yAxis.drawLabelsEnabled = true
        
        radarChart.rotationEnabled = false
        chartDataSet.setColor(.blue)
        chartDataSetA.setColor(.orange)
        
        //Present the number as integer
        let numberFormatter = NumberFormatter()
        numberFormatter.generatesDecimalNumbers = false
        chartDataSet.valueFormatter = numberFormatter as? IValueFormatter
        radarChart.yAxis.valueFormatter = numberFormatter as? IAxisValueFormatter
        radarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:nombresRadarChart)
        
        //Other options
        radarChart.legend.enabled = true
        radarChart.yAxis.gridAntialiasEnabled = true
        radarChart.animate(yAxisDuration: 2.0)
        
        chartDataSetA.valueFormatter = numberFormatter as? IValueFormatter
        
        //arreglo para cada dataSet
        var dataSetssss: [RadarChartDataSet] = [RadarChartDataSet]()
        
        dataSetssss.append(chartDataSetA)
        dataSetssss.append(chartDataSet)
        
        let chartData = RadarChartData(dataSets: dataSetssss)
        chartData.labels = dataPoints
        
        //Quitar el double y pasarlo a Int
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        radarChart.data = chartData
        
        radarChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }
    
    
    //Funcion de la barChart
    func setBarChart(dataPoints: [String], values: [Double], values2: [Double],sortIndex:Int) {
        
        var dataEntries:[BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), yValues: [Double(values[i]), Double(values2[i])])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: " ")
        chartDataSet.colors = [UIColor.blue, UIColor.orange]
        chartDataSet.stackLabels = ["Puntos   ", "Bono"]
        let chartData = BarChartData(dataSet: chartDataSet)
        barChart.data = chartData
        chartDataSet.drawValuesEnabled = false
        
        //Quitar el double y pasarlo a Int
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        chartData.setValueFormatter(formatter)
        
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        barChart.xAxis.granularity = 1
        
        //lengens en el centro
        barChart.legend.horizontalAlignment = .center
        //quita labels de arriba
        barChart.xAxis.labelPosition = .bottom
        barChart.legend.enabled = true
        barChart.xAxis.labelRotationAngle = 90
        //quitar highlight si se toca la barra
        barChart.highlighter = nil
        //Quita los numeros de lado derecho
        barChart.rightAxis.enabled = false
        
        barChart.legend.font = UIFont(name: "Arial", size: 14.0)!
    }

}


extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            
            draw(in: CGRect(x: -origin.x, y: -origin.y,
                            width: size.width, height: size.height))
            
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}

