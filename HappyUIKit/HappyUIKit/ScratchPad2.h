
rbx = [[r15 _elementKind] retain];
r13 = [_objc_msgSend(r15, r13) retain];
r12 = [var_490 newIndexPathForSupplementaryElementOfKind:rbx oldIndexPath:r13];
[r15 setIndexPath:r12];
rdi = r12;
[rdi release];
[r13 release];
[rbx release];
rbx = [[_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:r15] retain];
[var_418->_initialAnimationLayoutAttributesDict setObject:r15 forKey:rbx];
[rbx release];
r12 = var_418;
r13 = var_480;
