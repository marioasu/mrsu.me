Date: 2015-11-16
Title: js函数对象调用的模式
intro: 之前一直没能理解var that = this;这种写法，了解了javascript的调用模式后豁然开朗
Tags: js
Status: public
Toc: yes
Position: 993

###摘录
在JavaScript中一共有4种调用模式：方法调用模式、函数调用模式、构造器调用模式和apply调用模式。这些模式在符合初始化关键参数this上存在差异。 --《JavaScript语言精粹》

首先应该明白关键字this是函数的（隐含的）附加参数

####方法调用模式
即函数作为对象的一个属性被调用，这时候函数是对象的一个方法

```javascript

var value = 7;

var myObject = {
	value: 0,
	increment: function(inc) {
		this.value += typeof inc === 'number' ? inc : 1; // 这里的this在方法被调用时绑定到myObject对象
	}
};

myObject.increment(3); // 调用myObject对象的方法（方法调用模式）

console.log(myObject.value); // 3 为myObject对象的属性
console.log(window.value); // 7 为全局对象（window）的属性

```

####函数调用模式
当函数并非对象的属性时，它被当作函数来调用，这时候this被绑定到全局对象（即window）

```javascript

var value = 7;

var myObject = {
	value: 0,
	increment: function(inc) {
		this.value += typeof inc === 'number' ? inc : 1;
	},
	double: function() {
		var helper = function() {
			this.value = this.value + this.value; // 这里的this在方法被调用时绑定到全局（window）对象
		}

		helper(); // helper以函数调用模式调用
	}
};

myObject.increment(3);
myObject.double();
console.log(myObject.value); // 3 // 并没被double
console.log(window.value); // 14 // 全局属性被改变

```

上面的例子可能不是我们希望看到的结果，我们希望在调用非对象自身的函数的时候也能都变了对象自身的属性
下面是解决方法，经典（迫不得已）的var that = this

```javascript

var value = 7;

var myObject = {
	value: 0,
	increment: function(inc) {
		this.value += typeof inc === 'number' ? inc : 1;
	},
	double: function() {
		var that = this; // 当double被调用时，this被绑定到myObject对象
		var helper = function() {
			that.value = that.value + that.value; // 内部函数访问外部函数的变量 避开了this关键字 这里的that指myObject
		}

		helper(); // helper以函数调用模式调用
	}
};

myObject.increment(3);
myObject.double();
console.log(myObject.value); // 6 // myObject对象的属性被double
console.log(window.value); // 7 // 全局属性未被改变

```