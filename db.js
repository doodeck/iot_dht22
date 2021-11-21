// db.js

const { Pool } = require('pg');
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

async function db_test(req, res) {
    try {
      const client = await pool.connect();
      const result = await client.query('SELECT * FROM test_table');
      const results = { 'results': (result) ? result.rows : null};
      console.log(JSON.stringify(results))
      res.json(200, results );
      client.release();
    } catch (err) {
      console.error(err);
      res.send("Error " + err);
    }
};

module.exports = {
    test: db_test
}