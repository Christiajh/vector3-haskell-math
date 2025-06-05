# 📐 Vector3: 3D Math Library in Haskell

A **simple, modular, and educational 3D vector library** built in **Haskell**. This project demonstrates key concepts of **functional programming**, precision-safe **vector mathematics**, and clean code design using algebraic data types and pattern matching.

> 📝 This project was developed as part of the **midterm exam (UTS) for Semester 2** in the *Dasar Pemrograman* course.

---

## ✨ Features

✅ 3D Vector Construction  
✅ Predicate Checks (origin, direction, equality)  
✅ Vector Arithmetic:
- Addition, Subtraction, Multiplication, Division
- Dot Product & Cross Product
- Magnitude & Normalization
- Angle Between Vectors (Radian & Degree)
- Distance, Reflection, Linear Interpolation

---

## 🔧 Functional Concepts Used

- **Algebraic Data Types** (ADT)
- **Pattern Matching**
- **Floating Point Handling**
- **Pure Functions & Composition**
- **Mathematical Modeling**

---

## 🧪 Example Input & Output

### ✅ Input:
1.0
0.0
0.0
0.0
1.0
0.0
0.5


### 📤 Output:
```haskell
isOrigin(v) = False
isOrigin(w) = False
isRight(v) = True
isRight(w) = False
isUp(v) = False
isUp(w) = True
isForward(v) = False
isForward(w) = False
isOne(v) = False
isOne(w) = False
isLeft(v) = False
isLeft(w) = False
isDown(v) = False
isDown(w) = False
isBack(v) = False
isBack(w) = False
isEquals(v, w) = False
isNotEquals(v, w) = True
vectorMax(v, w) = Vector3 {x = 1.0, y = 1.0, z = 0.0}
vectorMin(v, w) = Vector3 {x = 0.0, y = 0.0, z = 0.0}
magnitude(v) = 1.0
magnitude(w) = 1.0
normalized(v) = Vector3 {x = 1.0, y = 0.0, z = 0.0}
normalized(w) = Vector3 {x = 0.0, y = 1.0, z = 0.0}
dotProduct(v, w) = 0.0
crossProduct(v, w) = Vector3 {x = 0.0, y = 0.0, z = 1.0}
angle(v, w) [radian] = 1.57
angle(v, w) [degree] = 90.0
distance(v, w) = 1.41
scale(v, t) = Vector3 {x = 0.5, y = 0.0, z = 0.0}
addVector(v, w) = Vector3 {x = 1.0, y = 1.0, z = 0.0}
subVector(v, w) = Vector3 {x = 1.0, y = -1.0, z = 0.0}
mulVector(v, w) = Vector3 {x = 0.0, y = 0.0, z = 0.0}
divVector(v, w) = Vector3 {x = Infinity, y = 0.0, z = -Infinity}
reflect(v, w) = Vector3 {x = 1.0, y = 0.0, z = 0.0}
lerp(v, w, t) = Vector3 {x = 0.5, y = 0.5, z = 0.0}
