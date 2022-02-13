# glowing-enigma



## Model

The model is composed of 3 parts:

- Data structures

- API  class

- Parser class



### ViewController





### Workflow

At launch, the app fetchs the API through the `API` class to get all the data. 4 API calls are made. When the API calls are over, the `Parser` class is called to create a new structure `Event` . This stucture is build upon previously fetched data. When parsing is completed, a list of `Event` is returned to the view.






