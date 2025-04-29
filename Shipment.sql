CREATE DATABASE shipmentxpress;
USE shipmentxpress;
CREATE TABLE IF NOT EXISTS shipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tracking_number VARCHAR(50) NOT NULL UNIQUE,
    sender_name VARCHAR(100),
    receiver_name VARCHAR(100),
    origin VARCHAR(100),
    destination VARCHAR(100),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('655734', 'RIGHTWAYS', 'N/A', 'DEL', 'PNQ', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('696964', 'RIGHTWAYS', 'N/A', 'BLR', 'IXC', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('697701', 'RIGHTWAYS', 'N/A', 'BLR', 'PNQ', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('696802', 'RIGHTWAYS', 'N/A', 'BLR', 'DEL', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('759242', 'RIGHTWAYS', 'N/A', 'BLR', 'IDR', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('748775', 'RIGHTWAYS', 'N/A', 'DEL', 'PNQ', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('50294322', 'RIGHTWAYS', 'N/A', 'BOM', 'DEL', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('308630', 'RIGHTWAYS', 'N/A', 'DEL', 'PNQ', 'DELIVERED');
INSERT INTO shipments (tracking_number, sender_name, receiver_name, origin, destination, status) VALUES ('382060', 'RIGHTWAYS', 'N/A', 'BLR', 'DEL', 'DELIVERED');

ALTER TABLE shipments ADD COLUMN origin_lat DOUBLE;
ALTER TABLE shipments ADD COLUMN origin_lng DOUBLE;
ALTER TABLE shipments ADD COLUMN dest_lat DOUBLE;
ALTER TABLE shipments ADD COLUMN dest_lng DOUBLE;


-- Shipment 1: '655734' - Origin: 'DEL' (Delhi), Destination: 'PNQ' (Pune)
UPDATE shipments SET origin_lat = 28.7041, origin_lng = 77.1025 WHERE tracking_number = '655734'; -- Delhi
UPDATE shipments SET dest_lat = 18.5204, dest_lng = 73.8567 WHERE tracking_number = '655734'; -- Pune

-- Shipment 2: '696964' - Origin: 'BLR' (Bangalore), Destination: 'IXC' (Chandigarh)
UPDATE shipments SET origin_lat = 12.9716, origin_lng = 77.5946 WHERE tracking_number = '696964'; -- Bangalore
UPDATE shipments SET dest_lat = 30.7333, dest_lng = 76.7794 WHERE tracking_number = '696964'; -- Chandigarh

-- Shipment 3: '697701' - Origin: 'BLR' (Bangalore), Destination: 'PNQ' (Pune)
UPDATE shipments SET origin_lat = 12.9716, origin_lng = 77.5946 WHERE tracking_number = '697701'; -- Bangalore
UPDATE shipments SET dest_lat = 18.5204, dest_lng = 73.8567 WHERE tracking_number = '697701'; -- Pune

-- Shipment 4: '696802' - Origin: 'BLR' (Bangalore), Destination: 'DEL' (Delhi)
UPDATE shipments SET origin_lat = 12.9716, origin_lng = 77.5946 WHERE tracking_number = '696802'; -- Bangalore
UPDATE shipments SET dest_lat = 28.7041, dest_lng = 77.1025 WHERE tracking_number = '696802'; -- Delhi

-- Shipment 5: '759242' - Origin: 'BLR' (Bangalore), Destination: 'IDR' (Indore)
UPDATE shipments SET origin_lat = 12.9716, origin_lng = 77.5946 WHERE tracking_number = '759242'; -- Bangalore
UPDATE shipments SET dest_lat = 22.7196, dest_lng = 75.8577 WHERE tracking_number = '759242'; -- Indore

-- Shipment 6: '748775' - Origin: 'DEL' (Delhi), Destination: 'PNQ' (Pune)
UPDATE shipments SET origin_lat = 28.7041, origin_lng = 77.1025 WHERE tracking_number = '748775'; -- Delhi
UPDATE shipments SET dest_lat = 18.5204, dest_lng = 73.8567 WHERE tracking_number = '748775'; -- Pune

-- Shipment 7: '50294322' - Origin: 'BOM' (Mumbai), Destination: 'DEL' (Delhi)
UPDATE shipments SET origin_lat = 19.0760, origin_lng = 72.8777 WHERE tracking_number = '50294322'; -- Mumbai
UPDATE shipments SET dest_lat = 28.7041, dest_lng = 77.1025 WHERE tracking_number = '50294322'; -- Delhi

-- Shipment 8: '308630' - Origin: 'DEL' (Delhi), Destination: 'PNQ' (Pune)
UPDATE shipments SET origin_lat = 28.7041, origin_lng = 77.1025 WHERE tracking_number = '308630'; -- Delhi
UPDATE shipments SET dest_lat = 18.5204, dest_lng = 73.8567 WHERE tracking_number = '308630'; -- Pune

-- Shipment 9: '382060' - Origin: 'BLR' (Bangalore), Destination: 'DEL' (Delhi)
UPDATE shipments SET origin_lat = 12.9716, origin_lng = 77.5946 WHERE tracking_number = '382060'; -- Bangalore
UPDATE shipments SET dest_lat = 28.7041, dest_lng = 77.1025 WHERE tracking_number = '382060'; -- Delhi
