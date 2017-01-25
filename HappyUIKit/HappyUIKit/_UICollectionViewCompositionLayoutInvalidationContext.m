void -[_UICollectionViewCompositionLayoutInvalidationContext _setInvalidationContextTable:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [arg2 retain];
    r15 = r14->_invalidationContextTable;
    if (r15 != rbx) {
            r14->_invalidationContextTable = [rbx retain];
            [r15 release];
    }
    rdi = rbx;
    [rdi release];
    return;
}

void * -[_UICollectionViewCompositionLayoutInvalidationContext _invalidationContextTable](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_invalidationContextTable);
    return rax;
}

void -[_UICollectionViewCompositionLayoutInvalidationContext .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(self + *_OBJC_IVAR_$__UICollectionViewCompositionLayoutInvalidationContext._invalidationContextTable, 0x0);
    return;
}

