ALTER TABLE offices
    ADD FOREIGN KEY (company_id) REFERENCES companies (id);
ALTER TABLE offices
    ADD FOREIGN KEY (provider_id) REFERENCES companies (id);
ALTER TABLE offices
    ADD FOREIGN KEY (center_id) REFERENCES business_centers (id);
ALTER TABLE offices_versions
    ADD FOREIGN KEY (office_id) REFERENCES offices (id);
ALTER TABLE goods
    ADD FOREIGN KEY (warehouse_id) REFERENCES warehouses (id);
ALTER TABLE goods
    ADD FOREIGN KEY (supply_id) REFERENCES supplies (id);
ALTER TABLE employees
    ADD FOREIGN KEY (company_id) REFERENCES companies (id);
ALTER TABLE warehouses
    ADD FOREIGN KEY (provider_id) REFERENCES companies (id);
ALTER TABLE warehouses
    ADD FOREIGN KEY (company_id) REFERENCES companies (id);
ALTER TABLE supplies
    ADD FOREIGN KEY (warehouse_id) REFERENCES warehouses (id);
