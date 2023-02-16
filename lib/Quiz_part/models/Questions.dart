class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Which of the following is not a stable sorting algorithm in its typical implementation.",
    "options": ['Insertion Sort', 'Merge Sort', 'Quick Sort', 'Bubble Sort'],
    "answer_index": 2,
  },
  {
    "id": 2,
    "question":
        "Which of the following sorting algorithms has the lowest worst-case complexity?",
    "options": ['Bubble Sort', 'Merge Sort', 'Selection Sort', 'Quick Sort'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question":
        "Which search algorithm would be best to use with ordered data?",
    "options": [
      'linear search',
      'Either binary search or a linear search',
      'binary search',
      'None of Above'
    ],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question":
        "Suppose the elements 7, 2, 10 and 4 are inserted, in that order, into the valid 3- ary max heap found in the above question, Which one of the following is the sequence of items in the array representing the resultant heap?",
    "options": [
      '10, 7, 9, 8, 3, 1, 5, 2, 6, 4',
      '10, 9, 8, 7, 6, 5, 4, 3, 2, 1',
      '10, 9, 4, 5, 7, 6, 8, 2, 1, 3',
      '10, 8, 6, 9, 7, 2, 3, 4, 1, 5'
    ],
    "answer_index": 0,
  },
  {
    "id": 5,
    "question":
        "Identify the types of sorting that used the concept of divide and conquer.",
    "options": [
      'Merge sort',
      'Insertion Sort',
      'Selection sort',
      'Bubble sort'
    ],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "Identify the types of sorting that is slowest.",
    "options": ['Selection sort', 'Bubble sort', 'Quick sort', 'Merge sort'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question":
        "Which of these algorithms requires that the items it's given are in order?",
    "options": [
      'Insertion sort',
      'Bubble sort',
      'Binary search',
      'Linear search'
    ],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question":
        "Which sorting algorithm is more efficient with longer lists of data?",
    "options": ['Insertion sort', 'Merge sort', 'Both', 'Neither'],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question": "Binary search algorithm cannot be applied to _____",
    "options": [
      'sorted binary trees',
      'sorted linear array',
      'sorted linked list',
      'pointer array'
    ],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Complexity of linear search algorithm is _____",
    "options": ['O(logn)', 'O(n2)', 'O(n logn)', 'O(n)'],
    "answer_index": 3,
  },
];
