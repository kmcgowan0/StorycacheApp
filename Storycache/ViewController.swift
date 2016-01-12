import UIKit
import MapKit
import CoreLocation
import Foundation



class ViewController: UIViewController {
    
    
    
    //show distance from cache
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var storyLabel2: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var distance2: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    let stories = buildStories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        
        
    
        button.hidden = true
        secondBtn.hidden = true
        
//        for story in stories {
//            print(story.title)
//            print(story.images.count)
//            print(story.images)
//        }
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 100, identifier: "bournemouth")
        let bournemouthHill = CLLocationCoordinate2D(latitude: 50.713373, longitude: -1.888678)
        let bournemouthHillRegion = CLCircularRegion(center: bournemouthHill, radius: 100, identifier: "bournemouthHill")
        let bournemouthArea = CLCircularRegion(center: bournemouthPier, radius: 5000, identifier: "bournemoutharea")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        locationManager.startMonitoringForRegion(bournemouthHillRegion)
        locationManager.startMonitoringForRegion(bournemouthArea)
        
        
        let localNotification:UILocalNotification = UILocalNotification()
        
        localNotification.alertAction = "View"
        localNotification.alertBody = "You found a story!"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
     
    }
    
}








extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            print(newLocation)
            newLocation.distanceFromLocation(CLLocation(latitude: 50.716098, longitude: -1.875780))
            distance.text = "\(Double(newLocation.distanceFromLocation(CLLocation(latitude: 50.716098, longitude: -1.875780))).roundToPlaces(1))m"
            distance2.text = "\(Double(newLocation.distanceFromLocation(CLLocation(latitude: 50.713373, longitude: -1.888678))).roundToPlaces(1))m"
        }
        
        
        
    }
    
   
    
    
    
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        
        
        if region.identifier == "bournemouth" {
            button.hidden = false
            
            
           
        }
        
        if region.identifier == "bournemouthHill" {
            secondBtn.hidden = false
            
        }
        
        if region.identifier != "bournemouth" {
            button.hidden = true
        }
        
        
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region.identifier == "bournemouth" {
            button.hidden = true
        }
        if region.identifier == "bournemouthHill" {
            secondBtn.hidden = true
        }
        
    }
        
}




