# Project Requirements

## Functional Requirements

### BLINK-1: User Authentication

- **Identifier:** BLINK-1  
- **Name:** User Authentication  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** User credentials (username and password).  
- **Output:** Valid authentication token.  
- **Description:**  
  The system must validate user credentials and generate an authentication token for subsequent use. Validation will be performed through RMI communication with the authentication server.  
- **Preconditions:** The user must be registered in the system.  
- **Basic Flow:**  
  1. The user sends a login request through the SOAP service, including their credentials.  
  2. The application server invokes the RMI service of the authentication server to validate the credentials.  
  3. Upon successful validation, an authentication token is generated and returned.  
- **Alternative Flow:**  
  - If credentials are incorrect, the authentication server returns an error and access is denied, informing the user.

---

### BLINK-2: Creation of Directories/Subdirectories

- **Identifier:** BLINK-2  
- **Name:** Creation of Directories/Subdirectories  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Authentication token, directory name, parent directory identifier (optional).  
- **Output:** Confirmation of creation and update of the directory tree structure.  
- **Description:**  
  The system must allow users to create new directories or subdirectories, registering the information in the database through the REST API.  
- **Preconditions:** Authenticated user and existence of the parent directory if specified.  
- **Basic Flow:**  
  1. The user sends a SOAP request with the token, directory name, and optionally, the parent directory ID.  
  2. The application server validates the token and registers the new directory in the database through the REST API.  
  3. A confirmation of successful creation is returned.  
- **Alternative Flow:**  
  - If the token is invalid or the parent directory does not exist, an error is returned notifying the failure.

---

### BLINK-3: File Upload/Storage

- **Identifier:** BLINK-3  
- **Name:** File Upload/Storage  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Authentication token, one or more files and their metadata (name, size, etc.).  
- **Output:** Confirmation of storage and assigned location in storage nodes.  
- **Description:**  
  The system must allow users to upload files, distributing them across different nodes using gRPC, registering their metadata in the database through the REST API, and storing redundant copies of each file in at least two nodes.  
- **Preconditions:** Authenticated user and existence of the destination directory.  
- **Basic Flow:**  
  1. The user sends a SOAP request with the token and the file(s) along with their metadata.  
  2. The application server validates the token and coordinates the distribution of the file among the nodes using gRPC.  
  3. The file information is registered in the database through the REST API.  
  4. It ensures that redundant copies of the file are stored in at least two nodes.  
  5. A success confirmation is returned.  
- **Alternative Flow:**  
  - If an error occurs in communication with the nodes or in metadata registration, an error message is returned and a rollback or retry mechanism is activated.

---

### BLINK-4: File Reading/Download

- **Identifier:** BLINK-4  
- **Name:** File Reading/Download  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Authentication token, identifier or name of the file to download.  
- **Output:** Requested file in downloadable format.  
- **Description:**  
  The system must allow users to download existing files, retrieving them redundantly from storage nodes using gRPC and querying their metadata in the database through the REST API.  
- **Preconditions:** Authenticated user and existence of the file with assigned access permissions.  
- **Basic Flow:**  
  1. The user requests the download by sending the token and file identifier via SOAP.  
  2. The server validates the token, queries the metadata in the database, and coordinates with the nodes via gRPC to retrieve the file.  
  3. The file is returned to the user.  
- **Alternative Flow:**  
  - If the file does not exist or the user lacks permissions, an error message is returned.

---

### BLINK-5: Move/Rename Files or Directories

- **Identifier:** BLINK-5  
- **Name:** Move/Rename Files or Directories  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Authentication token, file or directory identifier, new name or destination location.  
- **Output:** Confirmation of location or name update.  
- **Description:**  
  The system must allow users to move or rename files and directories, updating the information in the database through the REST API.  
- **Preconditions:** Authenticated user and verified existence of the resource to be modified.  
- **Basic Flow:**  
  1. The user sends a SOAP request with the token, the resource ID, and the change information (new name or new location).  
  2. The server validates the token and the existence of the resource.  
  3. The corresponding information is updated in the database through the REST API.  
  4. A confirmation is returned to the user.  
- **Alternative Flow:**  
  - If the resource does not exist or an error occurs during the update, an error is returned and the operation is reverted.

---

### BLINK-6: Deletion of Files or Directories

- **Identifier:** BLINK-6  
- **Name:** Deletion of Files or Directories  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Authentication token, identifier of the file or directory to delete.  
- **Output:** Confirmation of resource deletion.  
- **Description:**  
  The system must allow users to delete files or directories, removing the information from the database (through the REST API) and deleting the physical files from the storage nodes using gRPC.  
- **Preconditions:** Authenticated user, existence of the resource, and appropriate permissions.  
- **Basic Flow:**  
  1. The user sends a SOAP request to delete a resource, providing the token and the corresponding ID.  
  2. The server validates the token, verifies the existence and permissions of the resource.  
  3. The record is deleted from the database and storage nodes are notified to delete the file.  
  4. A deletion confirmation is returned.  
- **Alternative Flow:**  
  - If the resource is not found or deletion fails on any of the nodes, an error is returned and a rollback of the operation is performed.

---

### BLINK-7: Sharing Files or Directories

- **Identifier:** BLINK-7  
- **Name:** Sharing Files or Directories  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Authentication token, resource identifier, list of recipient user identifiers.  
- **Output:** Confirmation of sharing and permission updates.  
- **Description:**  
  The system must allow users to share files or directories with other users, updating permissions in the database through the REST API.  
- **Preconditions:** Authenticated user, existence of the resource, and validity of recipient users.  
- **Basic Flow:**  
  1. The user sends a SOAP request with the token, the resource ID, and the list of users with whom it will be shared.  
  2. The server validates the token, the existence of the resource, and the recipient users.  
  3. The corresponding permissions are updated in the database through the REST API.  
  4. A confirmation of the action is returned.  
- **Alternative Flow:**  
  - If the resource or any of the users does not exist, a validation error is returned.

---

### BLINK-8: Storage Space Consumption Report

- **Identifier:** BLINK-8  
- **Name:** Storage Space Consumption Report  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Authentication token.  
- **Output:** Structured tree representing space consumption by directories and files.  
- **Description:**  
  The system must generate a visual tree-form report detailing storage space consumption, querying the information stored in the database through the REST API.  
- **Preconditions:** Authenticated user and existence of storage data in the database.  
- **Basic Flow:**  
  1. The user requests the report by sending the token through the SOAP service.  
  2. The server validates the token and retrieves consumption information from the database.  
  3. The tree representation of space consumption is generated and returned.  
- **Alternative Flow:**  
  - If an error occurs in the query or the token is invalid, an error message is returned.

---

## Non-Functional Requirements

### BLINK-9: System Performance

- **Identifier:** BLINK-9  
- **Name:** System Performance  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Concurrent requests for system operations.  
- **Output:** Responses processed within defined times (e.g., < 500 ms at maximum load).  
- **Description:**  
  The system must be capable of handling a high volume of concurrent requests, maintaining optimal response times even under high loads.  
- **Preconditions:** System deployed in performance test environment with simulated loads.  
- **Basic Flow:**  
  1. Multiple concurrent requests to the system are simulated.  
  2. The system processes the requests maintaining the stipulated performance.  
- **Alternative Flow:**  
  - If a performance degradation is detected, scaling mechanisms are activated and the operations team is notified for analysis and adjustment.

---

### BLINK-10: Horizontal Scalability

- **Identifier:** BLINK-10  
- **Name:** Horizontal Scalability  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Increase in user load and operations.  
- **Output:** Integration of new storage nodes and servers without service interruption.  
- **Description:**  
  The architecture must allow the dynamic addition of new nodes and servers to distribute the load and maintain system performance.  
- **Preconditions:** Availability of additional hardware and appropriate network configurations.  
- **Basic Flow:**  
  1. An increase in system load is detected.  
  2. New nodes or server instances are incorporated into the cluster automatically or through manual configuration.  
- **Alternative Flow:**  
  - In case of failure in incorporating new nodes, a recovery protocol is activated and the administrator is notified.

---

### BLINK-11: Availability and Fault Tolerance

- **Identifier:** BLINK-11  
- **Name:** Availability and Fault Tolerance  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Failures in one or more components (nodes, application servers, etc.).  
- **Output:** Continuous service with minimum availability of 99.9%.  
- **Description:**  
  The system must guarantee service continuity through redundancy and failover mechanisms, so that the failure of individual components does not interrupt global operability.  
- **Preconditions:** Implementation of redundancy, load balancing, and active monitoring.  
- **Basic Flow:**  
  1. A component failure occurs.  
  2. The system automatically redirects requests to redundant components without affecting the service.  
- **Alternative Flow:**  
  - If the failure affects multiple components, a contingency protocol is activated and the operations team is notified for immediate intervention.

---

### BLINK-12: Communication Security

- **Identifier:** BLINK-12  
- **Name:** Communication Security  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Data requests and responses between clients and internal components.  
- **Output:** Encrypted and authenticated data in all transmissions.  
- **Description:**  
  All communications between clients and servers (SOAP, RMI, REST, gRPC) must be conducted through secure channels (TLS/HTTPS) and use robust authentication mechanisms, protecting the integrity and confidentiality of information.  
- **Preconditions:** Valid digital certificates and encryption configurations implemented in each component.  
- **Basic Flow:**  
  1. A secure connection is established using TLS/HTTPS.  
  2. Communications are authenticated and data in transit is encrypted.  
- **Alternative Flow:**  
  - If any security failure is detected (e.g., expired certificates or encryption vulnerabilities), the connection is blocked and the security team is notified for corrective action.

---

### BLINK-13: Technological Compatibility and Integration

- **Identifier:** BLINK-13  
- **Name:** Technological Compatibility and Integration  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Interaction between diverse protocols and technologies (SOAP, RMI, REST, gRPC).  
- **Output:** Fluid communication and error-free integration between different components.  
- **Description:**  
  The system must ensure interoperability between the different technologies used, guaranteeing that integration between the authentication server (with MariaDB) and the database server (with PostgreSQL) occurs seamlessly and according to defined standards.  
- **Preconditions:** Clearly defined and documented interfaces and endpoints.  
- **Basic Flow:**  
  1. Connections are established between different services through their respective protocols.  
  2. Data transfer is correctly executed between components.  
- **Alternative Flow:**  
  - In case of incompatibilities, adapters or middleware are activated to resolve discrepancies, and an error log is generated for analysis.

---

### BLINK-14: Maintainability and Documentation

- **Identifier:** BLINK-14  
- **Name:** Maintainability and Documentation  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Requests for changes or updates to the system.  
- **Output:** Modular, well-structured, and documented code.  
- **Description:**  
  The solution must be designed in a modular fashion, following good software engineering practices, and have up-to-date documentation that facilitates future modifications and system maintenance.  
- **Preconditions:** Existence of coding and documentation standards and policies within the development team.  
- **Basic Flow:**  
  1. An update or modification is implemented in a specific module.  
  2. System integrity is maintained without affecting other modules and the corresponding documentation is updated.  
- **Alternative Flow:**  
  - If excessive dependencies or couplings are detected, a refactoring is planned and development guidelines are updated to avoid recurrences.

---

### BLINK-15: Monitoring and Logging

- **Identifier:** BLINK-15  
- **Name:** Monitoring and Logging  
- **Priority:** Medium  
- **Associated Requirement:** —  
- **Input:** Activities and events generated by the system.  
- **Output:** Detailed records (logs) and real-time alerts for incidents.  
- **Description:**  
  The system must implement a centralized monitoring solution that records all operations and events, facilitating early detection of anomalies and generation of alerts for corrective actions.  
- **Preconditions:** Implementation of a logging and monitoring infrastructure (e.g., ELK Stack, Prometheus, etc.).  
- **Basic Flow:**  
  1. All operations and critical events in the system are recorded.  
  2. The system analyzes the logs and, in case of detecting anomalies, generates real-time alerts.  
- **Alternative Flow:**  
  - If the logging or monitoring system fails, a backup protocol is activated and the operations team is notified for immediate review.

---

### BLINK-16: Database Replication

- **Identifier:** BLINK-16  
- **Name:** Database Replication  
- **Priority:** High  
- **Associated Requirement:** —  
- **Input:** Write events in the database of servers (MariaDB for authentication and PostgreSQL for database).  
- **Output:** Data synchronization between nodes and guaranteed availability in case of failures.  
- **Description:**  
  The system must implement database replication mechanisms to ensure consistency and high availability on both servers.  
- **Preconditions:** Replication configuration on database servers.  
- **Basic Flow:**  
  1. Each write operation is automatically replicated to a secondary node.  
  2. In case of failure, the system switches to the replica without data loss.  
- **Alternative Flow:**  
  - If replication fails, the operations team is notified to intervene and restore consistency.
