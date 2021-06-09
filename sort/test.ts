let array: Array<number> = [34, 160, 175, 90, 120];
let n: number = array.length;
sort(array, 0, n - 1);
console.log(array);

function separate (array: number[], min: number, max: number) {
    let pvt: number = array[max];
    let idx1: number = (min - 1);
    for (let idx2: number = min; idx2 <= max - 1; idx2++) {
        {
            if (array[idx2] < pvt) {
                idx1++;
                switchh(array, idx1, idx2);
            }
        }

    }
    switchh(array, idx1 + 1, max);
    return (idx1 + 1);
}

function switchh(array: number[], idx1: number, idx2: number){
    let temporary: number = array[idx1];
    array[idx1] = array[idx2];
    array[idx2] = temporary;
}

function sort (array: number[], min: number, max: number) {
    if (min < max) {
        let pvt: number = separate(array, min, max);
        sort(array, min, pvt - 1);
        sort(array, pvt + 1, max);
    }
}
