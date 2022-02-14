# glowing-enigma

by Rodophe Cailbault and Antonin Boulnois

### Model

The model is composed of 3 parts:

- Data structures

- API  class

- Parser class

### ViewController

The ViewController is composed of 3 parts:

- ContenView

- BlockView

- DetailsView

A `DataHandler` class is set in the Helper folder to help formating data.

### Workflow

At launch, the app fetchs the API through the `API` class to get all the data. 4 API calls are made. When the API calls are over, the `Parser` class is called to create a new structure `Event` . This stucture is build upon previously fetched data. When parsing is completed, a list of `Event` is returned to the view.
The main view waits for the data to be loaded or the API class to return an error. 
When loaded, the user can click on a block to display further information about the event.

### Features

- Fetch all the data of the events
- Manage API errors
- Display list of events
- Display details of an event
- Unit tests on API and Parser class



### Layout

#### Iphone 11

![iphone11](https://github.com/Otan2/glowing-enigma/blob/main/image/iphone11.png)

#### Iphone SE

![iphoneSE](https://github.com/Otan2/glowing-enigma/blob/main/image/iphoneSE.png)


