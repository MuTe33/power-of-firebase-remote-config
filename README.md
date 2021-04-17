# power-of-firebase-remote-config
 In this Project I will demonstrate you the power of firebase remote config :) This project serves as a template.

## Purpose of Firebase Remote Config

- Control app implementations remotely (Backend for Frontend)
- Adapt your app behaviour by various conditions
    - ApplicationId (Android) / Product Bundle Identifier (iOS)
    - Version
    - Build Number
    - Platform
    - Languages
    - Country and Region
    - User Audiences (i.e. Admin user, private customer, business customer, etc.)
    - User Property (based on your set Analytics User Properties)
    - Randomly
    - Date and/or Time
- Simple A/B Testing
    - Setting targets in same way as the above mentioned conditions
    - Define goal metrics such as:
        - Estimated total revenue
        - Retention
        - Custom Analytics defined events
        - Define Variants and Weighting (up to 7)
- Staged and controlled roll outs for specific features
    - Use A/B Testing functionality to do a staged roll out


## Things to take care of

You must be careful when activating those toggles. Always check which remote config flags should be activated for which app version. It might be that some features are not available for lower app version. Image your app is currently on version 2.0.0 and you add a new feature and make a new release. The new app version might be 2.1.0. So in order to activate the new feature in remote config make a condition that only app version 2.1.0 and higher are turned on.  


## Project Structure

The data flow of the architecture is as follows:
 
View --> ViewModel --> Domain <-- Data 

The domain layer is the only one not to have any dependencies. In the cleanest variant the domain layer would define an interface for the data layer and the data layer would be an implementation for that. But in this example it was kind of an overkill and I skipped the interface class.

## How to use this Project

- Fork it
- Change ApplicationId's (Android) to your defined ID's and/or setup flavoring for iOS
- Wire up Firebase and update google service json file (Don't publish your google service json file like in this project. I will delete the firebase project afterwards anyway, it's only for demonstration purposes)
- Define Remote Config Values
- Finally: Have Fun!


## Hints

- This project only supports Android
- I did not set up the flavoring for iOS
 


  
