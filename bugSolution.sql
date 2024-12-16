The solution depends on the root cause of the undefined function error.  Here are a few possibilities:

**1. Function Creation (if the function does not exist):**

```sql
CREATE FUNCTION getDepartmentName (employee_id INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE department_name VARCHAR(255);
  SELECT department_name INTO department_name FROM departments WHERE id = employee_id;
  RETURN department_name;
END;
```

**2. Correcting Function Name (if there was a typo):**

Correct the name in the query to match the existing function's name.

**3. Granting Access (if permissions are lacking):**

Grant the appropriate user or role the execute permission on the function:

```sql
GRANT EXECUTE ON FUNCTION getDepartmentName TO your_user_or_role;
```

**4. Adjusting the Schema (if the function is in a different schema):**

Specify the schema explicitly in the function call:

```sql
SELECT * FROM employees WHERE department = schema_name.getDepartmentName(1);
```

Replace `schema_name` with the actual schema where the function `getDepartmentName` resides.  The corrected query might look like this:

```sql
SELECT * FROM employees WHERE department = mySchema.getDepartmentName(1);
```

Remember to choose the solution that addresses the specific cause of the error in your environment.