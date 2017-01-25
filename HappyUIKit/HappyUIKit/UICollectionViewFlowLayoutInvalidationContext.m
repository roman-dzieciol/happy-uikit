

void * -[UICollectionViewFlowLayoutInvalidationContext init](void * self, void * _cmd) {
    rax = [[self super] init];
    if (rax != 0x0) {
        rax->_flowLayoutInvalidationFlags = rax->_flowLayoutInvalidationFlags | 0x3;
    }
    return rax;
}


void -[UICollectionViewFlowLayoutInvalidationContext setInvalidateFlowLayoutAttributes:](void * self, void * _cmd, bool arg2) {
    self->_flowLayoutInvalidationFlags = self->_flowLayoutInvalidationFlags & 0xfd | arg2 + arg2;
    return;
}

bool -[UICollectionViewFlowLayoutInvalidationContext invalidateFlowLayoutAttributes](void * self, void * _cmd) {
    rax = (self->_flowLayoutInvalidationFlags & 0x2) >> 0x1;
    return rax;
}

void -[UICollectionViewFlowLayoutInvalidationContext setInvalidateFlowLayoutDelegateMetrics:](void * self, void * _cmd, bool arg2) {
    self->_flowLayoutInvalidationFlags = self->_flowLayoutInvalidationFlags & 0xfe | arg2;
    return;
}

bool -[UICollectionViewFlowLayoutInvalidationContext invalidateFlowLayoutDelegateMetrics](void * self, void * _cmd) {
    rax = self->_flowLayoutInvalidationFlags & 0x1;
    return rax;
}

