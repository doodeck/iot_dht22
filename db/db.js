// db.js

const { Pool } = require('pg');
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});

function insert(req, res) {
  const sqlquery = 'INSERT INTO measurements(id, gpio, temp, hum) VALUES($1, $2, $3, $4)'
  const values = [req.query.id, req.query.in, req.query.temp, req.query.hum]
  // var self = this

  pool.connect((err, client, done) => {
    if (err) {
      res.send("Error " + err);
    }
    client.query(sqlquery, values, (err, result) => {
      done()
      if (err) {
        console.log(err.stack)
        console.log("Error " + err)
        res.sendStatus(500)
      } else {
        console.log(result.rows[0])
        res.sendStatus(200)
      }
    })
  })
}

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
  insert: insert,
  test: db_test
}