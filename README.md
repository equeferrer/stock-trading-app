# STOCK TRADING APPLICATION

This app allows users to search and buy stocks from different brokers using [IEX Cloud](https://iexcloud.io/docs/api/) API with a feature for market monitoring.

You can view the live application [here](https://eque-stocksapp.herokuapp.com/)


**Features**
- Single Table Inheritance for Users (Buyers, Brokers, Admin)
- Many-to-many relationship between Users and Stocks
- Test Driven Development (TDD) using RSpec
- Enabled buyers to check their transactions and view their stock portfolio.
- Implemented an admin dashboard to approve pending broker sign ups and  manage transactions.

**Screenshots**
![Stocks](https://user-images.githubusercontent.com/68733895/113651598-dbc7e880-96c4-11eb-9c3d-ce780f396f62.JPG)
![search](https://user-images.githubusercontent.com/68733895/113651601-de2a4280-96c4-11eb-9420-7e9da635dca5.JPG)
![Transactions](https://user-images.githubusercontent.com/68733895/113651608-dff40600-96c4-11eb-8e82-038051a37799.JPG)



**References:**
-[A Ruby client for the The IEX Cloud API](https://github.com/dblock/iex-ruby-client)
