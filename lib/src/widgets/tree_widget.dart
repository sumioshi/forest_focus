import 'package:flutter/material.dart';

class TreeWidget extends StatelessWidget {
  final String treeType;
  final double progress;
  final double size;
  final bool isPlanted;

  const TreeWidget({
    super.key,
    required this.treeType,
    required this.progress,
    this.size = 150,
    this.isPlanted = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Base da árvore
          if (progress > 0) _buildTreeBase(),
          
          // Copa da árvore
          if (progress > 0.4) _buildTreeTop(),
          
          // Indicador de progresso circular
          if (!isPlanted && progress < 1.0)
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.green.withOpacity(0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTreeBase() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: size * 0.2,
        height: size * 0.4 * progress,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.vertical(top: Radius.circular(size * 0.05)),
        ),
      ),
    );
  }

  Widget _buildTreeTop() {
    final topProgress = ((progress - 0.4) / 0.6).clamp(0.0, 1.0);
    
    return Positioned(
      bottom: size * 0.4,
      child: Container(
        width: size * 0.8 * topProgress,
        height: size * 0.6 * topProgress,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: treeType == 'pine' ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: treeType == 'pine' 
              ? BorderRadius.only(
                  topLeft: Radius.circular(size * 0.4),
                  topRight: Radius.circular(size * 0.4),
                )
              : null,
        ),
      ),
    );
  }
}