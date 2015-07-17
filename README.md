### current routes:

```
          Prefix Verb   URI Pattern                    Controller#Action
api_family_index GET    /api/family(.:format)          api/family#index
                 POST   /api/family(.:format)          api/family#create
  new_api_family GET    /api/family/new(.:format)      api/family#new
 edit_api_family GET    /api/family/:id/edit(.:format) api/family#edit
      api_family GET    /api/family/:id(.:format)      api/family#show
                 PATCH  /api/family/:id(.:format)      api/family#update
                 PUT    /api/family/:id(.:format)      api/family#update
                 DELETE /api/family/:id(.:format)      api/family#destroy
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
Required to create:
* name
* phone_number
* address
* nanny_name


### child object:

```
child = {
  name: child's name
  age: child's age
  allergies: child's allergies
  fav_food: child's favorite food
  interests: ['interest_1', 'interest_2', 'interest_3']
  bed_time: child's bed time
  potty_trained: true or false
  special_needs: true or false
}
```
Required to create:
* name


### nanny object:

```
nanny = {
  name: nanny's name
  family_id: family_id associated with nanny
}
```
Currently created when family is made
