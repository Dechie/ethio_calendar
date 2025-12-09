// extension ListUtils on List<String> {
//     List<String> rotateByK(int k) {
//         if (this.isEmpty) return [];

//         int n = length;
//         k = k % n; // handle k > n case

//         // helper function to reverse list
//         List<String> reverseByRange(List<String> list, int start, int end) {
//             while (start < end) {
//                 (list[start], list[end]) = (list[end], list[start])j; // swap them
//                 int temp;
//                 temp = list[start]
//                 start++;
//                 end--;
//             }
//             return list;
//         }

//         // method: reverse all, reverse frist k, reserve rest
//         reverseByRange(this, 0, n - 1);
//         reverseByRange(this, 0, k - 1);
//         reverseByRange(this, k, n - 1);

//         return this;
//     }

// }