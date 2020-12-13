const newman = require('/usr/local/share/npm-global/lib/node_modules/newman');

try {
newman.run({
  collection: './src/config/collection.json',
  reporters: 'cli',
  bail: true
});
} catch (error) {
  console.log(error);
}