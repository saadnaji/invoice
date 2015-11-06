# Invoice System


The problem. Our customer provided us with the following statement of their needs.

The subject is to invoice orders. To invoice is to change the state of an order (to change it from the state “pending” to “invoiced”). On an order, we have one and one only reference to an ordered product of a certain quantity. The quantity can be different to other orders. The same reference can be ordered on several different orders. The state of the order will be changed into “invoiced” if the ordered quantity is either less or equal to the quantity which is in stock according to the reference of the ordered product. You have to take into account new orders, cancellations of orders, and entries of quantities in the stock. End.

### Motivation
formal methods strive to provide for computer-based
systems (digital-hardware / software) what engineering
mathematics has provided in other fields of engineering:
◮ the ability to express specifications precisely,
◮ the ability to clearly define when an implementation meets the specification (“correctness”), and
◮ the ability to understand the specification and the
implementation better through “calculations”.

Source :G. Gopalakrishnan.

### Requirements elicitation

If our customer's needs are vague, we need to talk with them to elicit their requirements with precision and clarity. Here is an example of questions we might ask in order to clarify the role of the System Under Development (SUD):

Question 1: Is a “reference” in your your statement of needs a “product” (e.g. “nuts” or “bolts”)?

Answer: Yes. Or more precisely a product ID. You may assume that the product ID is entered by the user as a string, e.g “nuts”. The types of the products that customers may request must be entered into the system separately (e.g. before a customer can order 100 “bolts”, the type “bolts” must already have been registered as a legitimate product type).

Question 2: Is it really required (as it would seem from the statement of needs) that an order be limited to a single item, e.g. 100 bolts. Might the user not want the order to contain mutiple items,e.g. 50 “nuts” and 250 “bolts”?

Answer: You are right. The statement of needs did seem to convey an incorrect impression that would be over-restrictive. Indeed, a user may wish to order several items in a single order.

Question 3: When an order of product items and their quantities is requested, must the user provide the order ID, or does the system (SUD) generate the order ID?

Answer: The system should generate order IDs. [Note: in order to test that the system generates correct outputs, the SUD must generate order IDs in sequence starting at 1, 2, 3 … n, where n is some positive integer depending on memory available. If an order is later cancelled, then the order ID is made available for re-use on a first-in/first-out basis. For the purposes of this project, n= 10,000]

Aside: Our customer might not have access to the source code. Or they might not have the expertise to re-compile the code. Thus, in a real project, n would probably be specified in a configuration file or via a preferences menu

### Version
2.0

### Requirements and System Under Description
A requirement is a separately verifiable contractual statement stating a need of
the customer. A precise requirements document describes everything necessary to
produce a safe and correct system—one that fulfills the needs of the customer—
nothing more. At the same time the specification must not over-constrain developers
by venturing into design and implementation detail.


### Grammar specification of input commands
invoice_definitions.txt

system invoice

* nothing 
  
  --skip

* add_type(product_id: STRING)

    -- e.g. add("nuts")

    -- product types must be declared in advance of orders
* add_product(a_product: STRING; quantity: INTEGER)

    -- e.g. add_product("nuts", 1000)

    -- adds 1000 nuts to stock
* add_order (a_order: ARRAY[ TUPLE[ pid:STRING; no:INTEGER ] ] )

    -- e.g. place_order(<<["nuts", 5], ["bolts", 12]>> )

    -- system assigns a unique order ID seen at the output

    -- if successful, items removed from stock

* invoice(order_id: INTEGER)

    -- e.g. do_invoice(1)

    -- change order ID 1 from pending to invoiced

* cancel_order(order_id: INTEGER)
    
    -- e.g. cancel_order(1)
    
    -- items are returned to stock
    
    -- order_id is freed up
    
### More information

For more information about the system under description check report.pdf.

### Software

Dillinger is currently extended with the following plugins

* Eiffel
* PVS




License
----

GPLV3


