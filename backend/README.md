# Introduction

Areix Ledger is an expense tracking mobile application which records the user expenses and creates an analytical view based on these expenses. Features include:

- categorizing expenses
- calculating and analyzing user expense
- allows user to perform sorting and filtering

# Requirements

- Use flask or fastapi
- Data will be stored in the database
- An comprehensive api documentation (can use flasgger,flask-swagger sort of library)
- Error handling

# Task 1
API development, the detail has been illstrated in the below. Please don't neglect the items in the `Note`.

## Create Expense

  Create an expense record.

* **URL**

  /api/expense

* **Method:**

  `POST`
  
*  **URL Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Data Params**

| Name | Type | Description |
| :---: | :---: | --- |
| name | string | expense record name |
| amount | double | expense record amount |
| category | string | expense record category |
| created_at | string | expense record created date |

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 

```
{
    “data”: {
      'record_id': 1231343112,
      'name': xxx,
      'amount': 900.0,
      'category': 'Leisure',
      'created_at': '2020-02-02'
    },
    “error”: false,
    “success”: true,
    “msg”: “successfully created...”
    }
```
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "...." }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Note:**

    1. please make sure category is belonged one of the following:
        - Financials
        - Leisure
        - Others
        - Home
    2. please make sure the amount is > 0
    3. please make sure the record id is unique


## Get Expense record list

  Return Expense record List data

* **URL**

  /api/expenses?page={page}&per_page={per_page}

* **Method:**

  `GET`
  
*  **URL Params**

| Name | Type | Description |
| :---: | :---: | --- |
| page | int | page |
| per_page | int | number of items per page |

* **Data Params**

| Name | Type | Description |
| :---: | :---: | --- |
|  |  | |

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 
```
{
  “data”: [
    {
      "record_id": "x11",
      "name": "xxx1",
      "created_at": '2020-04-23',
      "amount": 22133.23,
      "category":"Home",
    },
    ...
  ],
  “error”: false,
  “success”: true,
  “msg”: “successfully created...”
}
```
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "...." }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Note:**

    1. please implement the pagination
  

## Get Expense record detail

  Return Expense record detail data

* **URL**

  /api/expense/:record_id

* **Method:**

  `GET`
  
*  **URL Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Data Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 

```
{
  “data”: {
      "record_id": "x11",
      "name": "xxx1",
      "created_at": '2020-04-23',
      "amount": 22133.23,
      "category":"Home",
  },
  “error”: false,
  “success”: true,
  “msg”: “successfully created...”
}
```
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "...." }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Note:**

    None
  
## Edit Expense record

  Edit Expense record

* **URL**

  /api/expense/:record_id

* **Method:**

  `PUT`
  
*  **URL Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Data Params**

| Name | Type | Description |
| :---: | :---: | --- |
| name | string | |
| amount | double | |
| category | string | |
| created_at | string | |

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 

```
{
  “data”: None,
  “error”: false,
  “success”: true,
  “msg”: “successfully updated...”
}
```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "...." }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Note:**

    1. please make sure category is belonged one of the following:
        - Financials
        - Leisure
        - Others
        - Home
    2. please make sure the amount is > 0
    3. please make sure the record id is unique

## Delete Expense record

  Delete Expense record

* **URL**

  /api/expense/:record_id

* **Method:**

  `DELETE`
  
*  **URL Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Data Params**

| Name | Type | Description |
| :---: | :---: | --- |
| | | |

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** 

```
{
  “data”: None,
  “error”: false,
  “success”: true,
  “msg”: “successfully deleted...”
}
```

* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "...." }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

* **Note:**

    None


# Task 2 (Bonus task)

## Mission 1
Implement 3 new APIs to provide filtered or sorted result of expense records.

1. Filter by `category`
2. Sort by `created_at`
3. Filter by month (refer to `created_at`)

## Mission 2
Implement a new API to provide expense records analysis result. E.g sum of of expense amount, mean of all expenses, day over day percentage change....