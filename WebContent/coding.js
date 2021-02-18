window.onload = function(){
	putwords();
}

function putwords(){
	node=document.getElementsByClassName('node0')[0];
	node.style.position = 'absolute';
	node.style.top = '50%';
	node.style.left = '50%';
	length=80;

	var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	ctx.strokeStyle = "#aaaaaa";
	ctx.lineWidth = 4;
	ctx.beginPath();

	for(var i = 1;(node = document.getElementsByClassName('node'+ i)).length > 0;i++){
		length *= 0.4;
		for(var j=0;j<node.length;j++){
			node[j].style.position = 'absolute';
			var parent = node[j].className.split(' ')[1];
			parent = parent.replace('parent','word');
			var elem = document.getElementById(parent);
			node[j].style.left = parseInt(elem.style.left) - length*Math.sin((j*2+1)*Math.PI/5) + '%';
			node[j].style.top = parseInt(elem.style.top) + length*Math.cos((j*2+1)*Math.PI/5) + '%';
			ctx.moveTo(parseInt(elem.style.left)*8,parseInt(elem.style.top)*8);
			ctx.lineTo(parseInt(node[j].style.left)*8,parseInt(node[j].style.top)*8);
		}
	}
	ctx.closePath();
	ctx.stroke();
	anime({
		targets: canvas,
		scale: [0,1]
	});
	for(var i = 1;(node = document.getElementsByClassName('node'+ i)).length > 0;i++){
		for(var j=0;j<node.length;j++){
			node[j].style.position = 'absolute';
			var parent = node[j].className.split(' ')[1];
			parent = parent.replace('parent','word');
			var elem = document.getElementById(parent);
			anime({
				targets: node[j],
				left: [elem.style.left, node[j].style.left],
				top: [elem.style.top, node[j].style.top]
			});
		}
	}
}
