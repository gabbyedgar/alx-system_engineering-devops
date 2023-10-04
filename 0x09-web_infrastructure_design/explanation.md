##0-simple_web_stack

Server: A server is a computer system that provides services or resources to other computers, known as clients, over a network. In this case, our server will host all the components of the web infrastructure required to run the website.

Domain Name: The domain name, in this case, is foobar.com. It acts as a human-readable alias for the server's IP address (8.8.8.8). When a user wants to access the website, they will type www.foobar.com into their web browser.

DNS Record: The www in www.foobar.com is a subdomain. In the Domain Name System (DNS) configuration, it will be represented as a CNAME (Canonical Name) record. This record points to the main domain (foobar.com) or directly to the server's IP address (8.8.8.8).

Web Server (Nginx): The web server's role is to handle incoming HTTP requests from users' web browsers and respond with the appropriate web pages. In our case, Nginx will act as the web server software, serving static files and forwarding dynamic requests to the application server.

Application Server: The application server is responsible for processing dynamic content and generating web pages. It interprets code (e.g., PHP, Python, Ruby) and interacts with the database to fetch or store data. In our setup, we will use a simple example code base for the application server.

Application Files (Code Base): This is the collection of code and files that make up the website's application. It can include HTML, CSS, JavaScript, and server-side code (e.g., PHP files) that define how the website behaves and looks.

Database (MySQL): The database is where the website stores and retrieves data. In our case, we will use MySQL as the relational database management system. It will be responsible for storing dynamic data such as user accounts, posts, comments, etc.

Communication with User's Computer: The server communicates with the user's computer via the HTTP protocol. When a user requests the website by typing www.foobar.com in their browser, a series of HTTP requests and responses are exchanged between the user's computer and the server.

Issues with the Infrastructure:

Single Point of Failure (SPOF): Since we have only one server, if it goes down or experiences any issues, the entire website will become inaccessible. There's no redundancy or failover mechanism in place.

Downtime during Maintenance: When maintenance is needed, such as deploying new code or updating the web server, the website will experience downtime. This can lead to a negative user experience and potential loss of traffic.

Limited Scalability: With only one server, the infrastructure cannot handle a large amount of incoming traffic. As the website gains popularity and user traffic increases, the server may become overwhelmed and slow down, leading to performance issues.

To address these issues, we could consider implementing solutions like:

Load Balancer: Introduce a load balancer in front of multiple servers to distribute incoming traffic evenly. This helps eliminate the SPOF and improves scalability.

High Availability: Set up redundant servers and databases in different geographic locations to ensure high availability and failover capabilities.

Continuous Deployment: Implement a continuous deployment system that allows code updates to be rolled out seamlessly without causing downtime.

Caching: Utilize caching mechanisms to reduce the load on the server and improve performance for frequently accessed content.

Content Delivery Network (CDN): Use a CDN to distribute static assets like images, stylesheets, and scripts, reducing the load on the web server and improving global accessibility.






##1-distributed_web_infrastructure

Server 1: This server will act as the primary web server and host the Nginx web server. Nginx will handle incoming HTTP requests, serve static files, and forward dynamic requests to the application server.

Server 2: This server will act as the secondary web server and will be identical to Server 1. Having two web servers ensures redundancy and high availability.

Server 3: This server will host the application server (e.g., PHP, Python, Ruby), which will handle dynamic content generation and interact with the database.

Load Balancer (HAproxy): The load balancer's role is to distribute incoming traffic across the two web servers (Server 1 and Server 2) to ensure load balancing and high availability.

Application Files (Code Base): This is the set of code and files that make up the website's application. It includes HTML, CSS, JavaScript, and server-side code.

Database (MySQL): The database will be a Primary-Replica (Master-Slave) cluster. It consists of two nodes: the Primary node and the Replica node. The primary node is responsible for handling read and write operations, while the replica node(s) replicate data from the primary node and can handle read-only operations.

Explanation of Specifics:

Additional Servers: By adding two servers, we introduce redundancy and high availability. If one server fails, the other can take over, minimizing downtime and eliminating the Single Point of Failure (SPOF).

Load Balancer (HAproxy): The load balancer is essential to distribute incoming traffic across the two web servers, ensuring that the load is evenly distributed. This prevents one server from becoming overwhelmed and improves performance and responsiveness.

Primary-Replica (Master-Slave) Database Cluster: The database cluster consists of a Primary node and a Replica node. The Primary node handles read and write operations, while the Replica node(s) replicate data from the Primary node and can handle read-only operations. This setup improves read scalability and provides data redundancy.

Distribution Algorithm for Load Balancer (HAproxy): The load balancer can be configured with a Round Robin algorithm. With Round Robin, each incoming request is sequentially assigned to the next available server in the list. This ensures that each server receives an equal share of requests.

Active-Active vs. Active-Passive Setup: In this infrastructure, we have an Active-Active setup since both web servers (Server 1 and Server 2) are actively serving requests. If one server fails, the load balancer can reroute traffic to the other server, maintaining high availability.

Database Primary-Replica (Master-Slave) Cluster: In a Primary-Replica setup, the Primary node handles both read and write operations. When data is written to the Primary node, it is asynchronously replicated to the Replica node(s). Replica nodes only handle read operations, offloading read queries from the Primary node and improving overall database performance.

Difference between Primary and Replica Node for the Application: The application connects to the Primary node for all read and write operations. Write operations update the data in the Primary node, and then the data is asynchronously replicated to the Replica node(s). The application can optionally connect to Replica node(s) for read-only operations, which can help distribute read traffic and reduce the load on the Primary node.

Issues with the Infrastructure:

Single Point of Failure (SPOF): Although we have redundancy for web servers and a database replica, the load balancer itself could be a potential SPOF. If the load balancer fails, it will disrupt the distribution of incoming traffic.

Security Issues: The infrastructure lacks a firewall, leaving the servers vulnerable to unauthorized access or attacks. Additionally, there's no HTTPS implementation, which means data transmission between users and servers is not encrypted, potentially exposing sensitive information.

No Monitoring: Without monitoring tools and systems in place, it will be challenging to detect and respond to performance issues, server failures, or potential security breaches promptly.

To improve the infrastructure, we would need to address these issues by adding a redundant load balancer, implementing firewalls and HTTPS, and setting up monitoring and alerting mechanisms. Additionally, we should also consider backup and disaster recovery solutions for the database to further enhance data resilience and availability.

##2-secured_and_monitored_web_infrastructure

Server 1: This server will host the Nginx web server and act as the primary web server, responsible for serving HTTP/HTTPS requests.

Server 2: This server will also host the Nginx web server and serve as the secondary web server, providing redundancy and high availability.

Server 3: This server will host the application server (e.g., PHP, Python, Ruby), responsible for handling dynamic content and interactions with the database.

Load Balancer (with SSL termination): The load balancer will distribute incoming HTTPS requests across the two web servers. It will also handle SSL termination, decrypting incoming HTTPS traffic and forwarding it to the web servers as plain HTTP.

SSL Certificate: An SSL certificate will be installed on the load balancer to enable HTTPS for the website. This ensures encrypted communication between the users' browsers and the web servers, enhancing security and protecting sensitive data.

Firewalls: Each server will have its own firewall to control incoming and outgoing network traffic. Firewalls help protect the servers from unauthorized access and potential security threats.

Monitoring Clients (Data Collectors): Each server will have a monitoring client installed, acting as a data collector to gather server performance metrics, log data, and other relevant information. The collected data will be sent to a centralized monitoring service like Sumo Logic or other monitoring services.

Explanation of Specifics:

Firewalls: Firewalls are added to each server to restrict and control network traffic. They act as a barrier between the servers and the outside world, allowing only authorized traffic to pass through and blocking potential threats.

HTTPS: Serving traffic over HTTPS is essential for security. HTTPS encrypts data transmitted between users' browsers and the servers, preventing unauthorized interception and ensuring data integrity.

Monitoring: Monitoring is used to keep track of the servers' health, performance, and security. It helps identify potential issues, track resource utilization, and ensure the infrastructure operates optimally.

Monitoring Tool and Data Collection: The monitoring tool (e.g., Sumo Logic) is a centralized service that collects data from the monitoring clients on each server. It processes and analyzes the data to generate performance metrics, logs, and alerts.

Monitoring Web Server QPS: To monitor the web server's queries per second (QPS), the monitoring tool would track the incoming requests to the web servers over a specific time frame and calculate the average QPS.

Issues with the Infrastructure:

Terminating SSL at the Load Balancer Level: Terminating SSL at the load balancer means the traffic between the load balancer and web servers is in plain HTTP. This creates a security risk since the internal communication is not encrypted. Ideally, SSL termination should occur on the web servers themselves.

Single MySQL Server Accepting Writes: Having only one MySQL server capable of accepting writes creates a Single Point of Failure (SPOF). If the database server fails, the website will lose write functionality, leading to downtime and data inconsistency.

Servers with All the Same Components: Having servers with identical components (database, web server, application server) can be a problem for scalability and redundancy. It is better to have separate database nodes in a cluster to distribute the database workload and improve fault tolerance.

To address these issues, we can implement SSL termination on the web servers, set up a MySQL cluster with multiple nodes, and consider diversifying server components for better scalability and high availability. Additionally, we should ensure that the monitoring setup includes all critical components and is properly configured to detect and respond to potential issues proactively.
