/*
  # Fix anonymous permissions for missing tables

  1. Security
    - Add policies to allow anonymous read access to delivery_partners table
    - Add policies to allow anonymous read access to customer_assignments table
    - Add policies to allow anonymous read access to suppliers table
    - Add policies to allow anonymous read access to daily_allocations table
    - Add policies to allow anonymous read access to deliveries table

  2. Changes
    - Enable RLS on all tables if not already enabled
    - Create SELECT policies for anon role on all required tables
    - This resolves "table not found" errors for unauthenticated users
*/

-- Enable RLS on all tables (if not already enabled)
ALTER TABLE delivery_partners ENABLE ROW LEVEL SECURITY;
ALTER TABLE customer_assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE daily_allocations ENABLE ROW LEVEL SECURITY;
ALTER TABLE deliveries ENABLE ROW LEVEL SECURITY;

-- Drop existing anonymous policies if they exist
DROP POLICY IF EXISTS "Allow anonymous read access" ON delivery_partners;
DROP POLICY IF EXISTS "Allow anonymous read access" ON customer_assignments;
DROP POLICY IF EXISTS "Allow anonymous read access" ON suppliers;
DROP POLICY IF EXISTS "Allow anonymous read access" ON daily_allocations;
DROP POLICY IF EXISTS "Allow anonymous read access" ON deliveries;

-- Allow anonymous read access to delivery_partners
CREATE POLICY "Allow anonymous read access" ON delivery_partners
  FOR SELECT
  TO anon
  USING (true);

-- Allow anonymous read access to customer_assignments
CREATE POLICY "Allow anonymous read access" ON customer_assignments
  FOR SELECT
  TO anon
  USING (true);

-- Allow anonymous read access to suppliers
CREATE POLICY "Allow anonymous read access" ON suppliers
  FOR SELECT
  TO anon
  USING (true);

-- Allow anonymous read access to daily_allocations
CREATE POLICY "Allow anonymous read access" ON daily_allocations
  FOR SELECT
  TO anon
  USING (true);

-- Allow anonymous read access to deliveries
CREATE POLICY "Allow anonymous read access" ON deliveries
  FOR SELECT
  TO anon
  USING (true);