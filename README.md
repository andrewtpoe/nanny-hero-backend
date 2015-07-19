### current API urls available:

```
Verb   URI Pattern                          Controller#Action

GET    /api/family                          api/family#index
* Returns an array of all family objects (see below for data structure)

GET    /api/family/:name                    api/family#show
* Will return the family object where the :name is an exact match to the family's name. Case sensitive. Will return 404 if no record exists.

POST   /api/family/(family object)          api/family#create
* Will create a new family record if all data present & valid. Will return 422 error if not.

PATCH  /api/family/:name/(family object)    api/family#update
* Will update all attributes sent if valid. Will return 422 if data is not valid or :name does not exist

DELETE /api/family/:name                    api/family#destroy
* Will delete family object with matching name, plus all of the families children.

POST   /api/family/:family_name/child/(child object)    api/child#create
* Will create a new child and relate it to the family name provided.

DELETE /api/family/:family_name/child/:id   api/child#destroy
* Requires the unique ID of the child (returned in show family query above). Will delete that single child from the records.

GET    /api/nanny/:name                     api/nanny#show
* Will return a nanny object (see below for data structure) where the :name is an exact match. Case sensitive. Will return 404 if no nanny is found.

DELETE /api/nanny/:name                     api/nanny#destroy
* Will delete nanny object and all related families and their children. Use with caution!
```

### family object:

```
family = {
  name: unique family name
  phone_number: family's phone number
  address: family's address
  picture: link to picture
  nanny: nanny's name
  children: [ child_object_1, child_object_2, child_object_3 ]
}
```
MINIMUM REQUIRED TO CREATE NEW FAMILY RECORD:
* name
* phone_number
* address
* nanny
* at least one valid child object in the array


### child object:

```
child = {
  child_id: child's id (will be sent to you when GET request is made, must be returned to update children)
  name: child's name
  age: child's age
  allergies: child's allergies
  fav_food: child's favorite food
  interests: "interest_1, interest_2, interest_3"
  bed_time: child's bed time
  potty_trained: yes/no
  special_needs: yes/no
}
```
MINIMUM REQUIRED TO CREATE NEW CHILD RECORD:
* name


### nanny object:

```
nanny = {
  name: nanny's name
  families: [family_object_1, family_object_2, family_object_3]
}
```
Nannies are currently created only when a family is stored.
