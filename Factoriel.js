
function factoriel(n) {
    if(n ===0) {
        return 1
} else {
    res = 1;
    for(i = 2; i <= n; i++) {
        res *= i
    }
    return res
    }
    
}
console.log(factoriel(10))