package com.runner.test;

import org.junit.jupiter.api.Test;
import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    // this will run all *.feature files that exist in sub-directories 
    @Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
    
}
