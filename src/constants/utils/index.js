const writeErrorAndExit = (error) => {
    console.error("\n\n============================= ERROR =============================\n");
    console.error(error.stack);
    console.error(error.name);
    console.error(error.message);
    console.error("\n\n================================================================");
  
    process.exit(1);
  }
  
  module.exports = {
    writeErrorAndExit,
  };  