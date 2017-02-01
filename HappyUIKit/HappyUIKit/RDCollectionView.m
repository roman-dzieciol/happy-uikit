//
//  RDCollectionView.m
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/27/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import "RDCollectionView.h"
#import "RDCollectionViewCell.h"

@implementation RDCollectionView

- (id)indexPathsForSelectedItems {
    return nil;
}

- (void)setIndexPathsForSelectedItems:(NSArray<NSIndexPath *> * _Nullable)indexPathsForSelectedItems {
    
}


#if 0


+ (id)_reuseKeyForSupplementaryViewOfKind:(id)arg1 withReuseIdentifier:(id)arg2;

//- (void).cxx_destruct;
- (void)_addContainerScrollViewForNotifications:(id)arg1;
- (void)_addControlledSubview:(id)arg1 atZIndex:(NSInteger)arg2;
- (void)_addEntriesFromDictionary:(id)arg1 inDictionary:(id)arg2;
- (void)_addEntriesFromDictionary:(id)arg1 inDictionary:(id)arg2 andSet:(id)arg3;
- (void)_adjustForAutomaticKeyboardInfo:(id)arg1 animated:(bool)arg2 lastAdjustment:(double*)arg3;
- (bool)_allowsEffectiveMultipleSelection;
- (bool)_allowsEffectiveSelection;
- (bool)_allowsMultipleSelectionDuringEditing;
- (bool)_allowsSelectionDuringEditing;
- (void)_applyBlockToAllReusableViews:(id /* block */)arg1;
- (void)_applyLayoutAttributes:(id)arg1 toView:(id)arg2;
- (id)_arrayForUpdateAction:(int)arg1;
- (void)_autoscrollForReordering:(id)arg1;
- (bool)_beginReorderingItemAtIndexPath:(id)arg1;
- (void)_beginUpdates;
- (bool)_canEditItemAtIndexPath:(id)arg1;
- (bool)_canPerformAction:(SEL)arg1 forCell:(id)arg2 sender:(id)arg3;
- (bool)_canReorderItemAtIndexPath:(id)arg1;
- (void)_cancelInteractiveTransitionWithFinalAnimation:(bool)arg1;
- (void)_cancelReordering;
- (void)_cancelTouches;
- (void)_cellBecameFocused:(id)arg1;
- (bool)_cellCanBecomeFocused:(id)arg1;
- (void)_cellDidBecomeFocused:(id)arg1;
- (void)_cellDidBecomeUnfocused:(id)arg1;
- (id)_cellForItemAtIndexPath:(id)arg1 includePrefetchedCells:(bool)arg2;
- (void)_cellMenuDismissed;
- (NSInteger)_cellPrefetchMode;
- (void)_checkForPreferredAttributesInView:(id)arg1 originalAttributes:(id)arg2;
- (id)_childFocusRegionsInRect:(CGRect)arg1;
- (void)_cleanUpAfterInteractiveTransitionDidFinish:(bool)arg1;
- (id)_collectionViewData;
- (void)_completeInteractiveMovementWithDisposition:(NSInteger)arg1;
- (CGRect)_computeFutureVisibleBoundsForPrefetchVelocity:(struct CGVector { double x1; double x2; })arg1 visibleBounds:(CGRect)arg2;
- (CGRect)_computePrefetchCacheValidationBoundsForPrefetchVelocity:(struct CGVector { double x1; double x2; })arg1 visibleBounds:(CGRect)arg2;
- (void)_computePrefetchCandidatesForVelocity:(struct CGVector { double x1; double x2; })arg1 notifyDelegateIfNeeded:(bool)arg2;
- (void)_computePrefetchCandidatesForVisibleBounds:(CGRect)arg1 futureVisibleBounds:(CGRect)arg2 prefetchVector:(struct CGVector { double x1; double x2; })arg3 notifyDelegateIfNeeded:(bool)arg4;
- (id)_contentFocusContainerGuide;
- (CGPoint)_contentOffsetForNewFrame:(CGRect)arg1 oldFrame:(CGRect)arg2 newContentSize:(CGSize)arg3 andOldContentSize:(CGSize)arg4;
- (id)_createPreparedCellForItemAtIndexPath:(id)arg1 withLayoutAttributes:(id)arg2 applyAttributes:(bool)arg3;
- (id)_createPreparedCellForItemAtIndexPath:(id)arg1 withLayoutAttributes:(id)arg2 applyAttributes:(bool)arg3 isFocused:(bool)arg4 notify:(bool)arg5;
- (id)_createPreparedSupplementaryViewForElementOfKind:(id)arg1 atIndexPath:(id)arg2 withLayoutAttributes:(id)arg3 applyAttributes:(bool)arg4;
- (id)_createTemplateLayoutCellForCellsWithIdentifier:(id)arg1;
- (id)_currentPromiseFulfillmentCell;
- (id)_currentTouch;
- (id)_currentUpdate;
- (bool)_dataSourceImplementsNumberOfSections;
- (bool)_dataSourceSupportsReordering;
- (UIEdgeInsets)_defaultLayoutMargins;
- (id)_delegatePreferredIndexPath;
- (CGPoint)_delegateTargetOffsetForProposedContentOffset:(CGPoint)arg1;
- (id)_dequeueReusableViewOfKind:(id)arg1 withIdentifier:(id)arg2 forIndexPath:(id)arg3 viewCategory:(NSUInteger)arg4;
- (void)_deselectAllAnimated:(bool)arg1 notifyDelegate:(bool)arg2;
- (void)_deselectItemAtIndexPath:(id)arg1 animated:(bool)arg2 notifyDelegate:(bool)arg3;
- (void)_didMoveFromWindow:(id)arg1 toWindow:(id)arg2;
- (void)_didScroll;
- (void)_didUpdateFocusInContext:(id)arg1 withAnimationCoordinator:(id)arg2;
- (id)_doubleSidedAnimationsForView:(id)arg1 withStartingLayoutAttributes:(id)arg2 startingLayout:(id)arg3 endingLayoutAttributes:(id)arg4 endingLayout:(id)arg5 withAnimationSetup:(id /* block */)arg6 animationCompletion:(id /* block */)arg7 enableCustomAnimations:(bool)arg8 customAnimationsType:(NSUInteger)arg9;
- (id)_dynamicAnimationsForTrackValues;
- (void)_endItemAnimationsWithInvalidationContext:(id)arg1;
- (void)_endItemAnimationsWithInvalidationContext:(id)arg1 tentativelyForReordering:(bool)arg2;
- (void)_endItemAnimationsWithInvalidationContext:(id)arg1 tentativelyForReordering:(bool)arg2 animator:(id)arg3;
- (id)_endOfContentFocusContainerGuide;
- (void)_endReordering;
- (void)_endUpdatesWithInvalidationContext:(id)arg1 tentativelyForReordering:(bool)arg2 animator:(id)arg3;
- (void)_ensureViewsAreLoadedInRect:(CGRect)arg1;
- (void)_finishInteractiveTransitionShouldFinish:(bool)arg1 finalAnimation:(bool)arg2;
- (void)_finishInteractiveTransitionWithFinalAnimation:(bool)arg1;
- (id)_focusedCell;
- (id)_focusedCellElementKind;
- (id)_focusedCellIndexPath;
- (void)_focusedView:(id)arg1 isMinX:(bool*)arg2 isMaxX:(bool*)arg3 isMinY:(bool*)arg4 isMaxY:(bool*)arg5;
- (id)_fulfillPromisedFocusRegionForCell:(id)arg1;
- (void)_geometryChanges:(id)arg1 forAncestor:(id)arg2;
- (void)_getOriginalReorderingIndexPaths:(id*)arg1 targetIndexPaths:(id*)arg2;
- (bool)_hasContainerScrollViewsAndScrollingDisabled;
- (bool)_hasFocusedCellForIndexPath:(id)arg1 shouldUsePreUpdateData:(bool)arg2;
- (bool)_hasPrefetchItems;
- (bool)_hasRegisteredClassOrNibForSupplementaryViewOfKind:(id)arg1;
- (void)_highlightFirstVisibleItemIfAppropriate;
- (bool)_highlightItemAtIndexPath:(id)arg1 animated:(bool)arg2 scrollPosition:(NSUInteger)arg3;
- (bool)_highlightItemAtIndexPath:(id)arg1 animated:(bool)arg2 scrollPosition:(NSInteger)arg3 notifyDelegate:(bool)arg4;
- (id)_indexPathForCell:(id)arg1 includePrefetchedCells:(bool)arg2;
- (id)_indexPathForView:(id)arg1 ofType:(NSUInteger)arg2 includePrefetchedCells:(bool)arg3;
- (bool)_indexPathIsValid:(id)arg1;
- (id)_indexPathsForVisibleDecorationViewsOfKind:(id)arg1;
- (id)_indexPathsForVisibleSupplementaryViewsOfKind:(id)arg1;
- (id)_indexPathsForVisibleSupplementaryViewsOfKind:(id)arg1 isDecorationView:(bool)arg2;
- (void)_invalidateLayoutIfNecessaryForReload;
- (void)_invalidateLayoutWithContext:(id)arg1;
- (void)_invalidateWithBlock:(id /* block */)arg1;
- (bool)_isEditing;
- (bool)_isReordering;
- (bool)_isViewInReuseQueue:(id)arg1;
- (bool)_itemIndexPathIsReordered:(id)arg1;
- (bool)_keepsFirstResponderVisibleOnBoundsChange;
- (id)_keysForObject:(id)arg1 inDictionary:(id)arg2;
- (id)_managedSubviewForView:(id)arg1;
- (id)_managedViews;
- (id /* block */)_navigationCompletion;
- (id)_objectInDictionary:(id)arg1 forKind:(id)arg2 indexPath:(id)arg3;
- (void)_offsetPinnedReorderedItemsWithCurrentContentOffset:(CGPoint)arg1;
- (void)_performAction:(SEL)arg1 forCell:(id)arg2 sender:(id)arg3;
- (void)_performBatchUpdates:(id /* block */)arg1 completion:(id /* block */)arg2 invalidationContext:(id)arg3;
- (void)_performBatchUpdates:(id /* block */)arg1 completion:(id /* block */)arg2 invalidationContext:(id)arg3 tentativelyForReordering:(bool)arg4;
- (void)_performBatchUpdates:(id /* block */)arg1 completion:(id /* block */)arg2 invalidationContext:(id)arg3 tentativelyForReordering:(bool)arg4 animator:(id)arg5;
- (void)_performReloadPrefetchIfNeeded;
- (void)_pinReorderedItemsWithPinningTest:(id /* block */)arg1;
- (id)_pivotForTransitionFromLayout:(id)arg1 toLayout:(id)arg2;
- (id)_preReorderingIndexPathForLayoutIndexPath:(id)arg1;
- (NSUInteger)_prefetchItemsForVelocity:(struct CGVector { double x1; double x2; })arg1 maxItemsToPrefetch:(NSUInteger)arg2;
- (NSUInteger)_prefetchItemsForVelocity:(struct CGVector { double x1; double x2; })arg1 maxItemsToPrefetch:(NSUInteger)arg2 invalidateCandidatesOnDirectionChanges:(bool)arg3;
- (bool)_prefetchingEnabledDefault;
- (void)_prepareLayoutForUpdates;
- (void)_prepareViewForUse:(id)arg1 withElementCategory:(NSUInteger)arg2 elementKind:(id)arg3 reuseIdentifier:(id)arg4 indexPath:(id)arg5;
- (void)_prepareViewForUse:(id)arg1 withElementCategory:(NSUInteger)arg2 elementKind:(id)arg3 reuseIdentifier:(id)arg4 indexPath:(id)arg5 applyDefaultAttributes:(bool)arg6;
- (void)_pruneCachedPrefetchViewsForCacheValidationBounds:(CGRect)arg1;
- (void)_pruneCachedPrefetchViewsForVelocity:(struct CGVector { double x1; double x2; })arg1;
- (void)_registerForGeometryChangesIfInSupeview;
- (void)_registeredSupplementaryViewKind:(id)arg1;
- (void)_reloadDataIfNeeded;
- (bool)_remembersPreviouslyFocusedItem;
- (void)_removeAnyAncestorScrollViewNotifications;
- (void)_removeContainerScrollViewForNotifications:(id)arg1;
- (id)_reorderFeedbackBehavior;
- (id)_reorderPrefetchCandidates:(id)arg1 forPrefetchVelocity:(struct CGVector { double x1; double x2; })arg2 visibleBounds:(CGRect)arg3;
- (id)_reorderedItemForView:(id)arg1;
- (id)_reorderedItems;
- (CGPoint)_reorderingTargetPosition;
- (void)_resetContainerScrollViewVisitationCount;
- (void)_resetCurrentPrefetchContext;
- (void)_resetPrefetchState;
- (void)_resetPrefetchedCachedCells;
- (void)_resumeReloads;
- (void)_reuseCell:(id)arg1;
- (void)_reuseCell:(id)arg1 notifyDidEndDisplaying:(bool)arg2;
- (id)_reuseDictionaryForCell:(bool)arg1;
- (void)_reusePreviouslyFocusedManagedSubviewIfNeeded:(id)arg1;
- (id)_reuseQueueForViewWithElementCategory:(NSUInteger)arg1 elementKind:(id)arg2 reuseIdentifier:(id)arg3;
- (void)_reuseSupplementaryView:(id)arg1;
- (void)_scrollFirstResponderCellToVisible:(bool)arg1;
- (void)_scrollViewDidEndDraggingWithDeceleration:(bool)arg1;
- (void)_scrollViewWillEndDraggingWithVelocity:(CGPoint)arg1 targetContentOffset:(inout CGPoint*)arg2;
- (void)_selectAllSelectedItems;
- (void)_selectItemAtIndexPath:(id)arg1 animated:(bool)arg2 scrollPosition:(NSUInteger)arg3 notifyDelegate:(bool)arg4;
- (id)_selectableIndexPathForItemContainingHitView:(id)arg1;
- (void)_setAllowsMultipleSelectionDuringEditing:(bool)arg1;
- (void)_setAllowsSelectionDuringEditing:(bool)arg1;
- (void)_setCellPrefetchMode:(NSInteger)arg1;
- (void)_setCollectionViewLayout:(id)arg1 animated:(bool)arg2 isInteractive:(bool)arg3 completion:(id /* block */)arg4;
- (void)_setCollectionViewLayout:(id)arg1 animated:(bool)arg2 isInteractive:(bool)arg3 completion:(id /* block */)arg4 animator:(id)arg5;
- (void)_setCurrentPromiseFulfillmentCell:(id)arg1;
- (void)_setCurrentTouch:(id)arg1;
- (void)_setDefaultLayoutMargins:(UIEdgeInsets)arg1;
- (void)_setExternalObjectTable:(id)arg1 forNibLoadingOfCellWithReuseIdentifier:(id)arg2;
- (void)_setExternalObjectTable:(id)arg1 forNibLoadingOfSupplementaryViewOfKind:(id)arg2 withReuseIdentifier:(id)arg3;
- (void)_setFocusedCell:(id)arg1;
- (void)_setFocusedCellElementKind:(id)arg1;
- (void)_setFocusedCellIndexPath:(id)arg1;
- (void)_setIsAncestorOfFirstResponder:(bool)arg1;
- (void)_setKeepsFirstResponderVisibleOnBoundsChange:(bool)arg1;
- (void)_setNavigationCompletion:(id /* block */)arg1;
- (void)_setNeedsVisibleCellsUpdate:(bool)arg1 withLayoutAttributes:(bool)arg2;
- (void)_setObject:(id)arg1 inDictionary:(id)arg2 forKind:(id)arg3 indexPath:(id)arg4;
- (void)_setRemembersPreviouslyFocusedItem:(bool)arg1;
- (void)_setReorderFeedbackBehavior:(id)arg1;
- (void)_setShouldDeriveVisibleBoundsFromContainingScrollView:(bool)arg1;
- (void)_setShouldPrefetchCellsWhenPerformingReloadData:(bool)arg1;
- (void)_setVisibleView:(id)arg1 forLayoutAttributes:(id)arg2;
- (void)_setupCellAnimations;
- (bool)_shouldDeriveVisibleBoundsFromContainingScrollView;
- (bool)_shouldFadeCellsForBoundChangeWhileRotating;
- (bool)_shouldPrefetchCells;
- (bool)_shouldPrefetchCellsWhenPerformingReloadData;
- (bool)_shouldScrollToContentBeginningInRightToLeft;
- (bool)_shouldShowMenuForCell:(id)arg1;
- (bool)_shouldUpdateFocusInContext:(id)arg1;
- (void)_stopAutoscrollTimer;
- (void)_suspendReloads;
- (id)_templateLayoutCellForCellsWithReuseIdentifier:(id)arg1;
- (void)_trackLayoutValue:(double)arg1 forKey:(id)arg2;
- (double)_trackedLayoutValueForKey:(id)arg1;
- (void)_unhighlightAllItems;
- (void)_unhighlightAllItemsAndHighlightGlobalItem:(NSInteger)arg1;
- (void)_unhighlightItemAtIndexPath:(id)arg1 animated:(bool)arg2;
- (void)_unhighlightItemAtIndexPath:(id)arg1 animated:(bool)arg2 notifyDelegate:(bool)arg3;
- (CGVector)_unitVectorForVector:(CGVector)arg1;
- (void)_unpinReorderedItemsIfNeeded;
- (void)_updateAnimationDidStop:(id)arg1 finished:(id)arg2 context:(id)arg3;
- (void)_updateBackgroundView;
- (void)_updateContainerScrollViewsForNotifications;
- (void)_updateContentFocusContainerGuides;
- (void)_updateDefaultLayoutMargins;
- (void)_updateEditing:(bool)arg1 forView:(id)arg2 atIndexPath:(id)arg3;
- (void)_updateFocusedCellIndexPathIfNecessaryWithLastFocusedRect:(CGRect)arg1;
- (void)_updateReorderingTargetPosition:(CGPoint)arg1;
- (void)_updateReorderingTargetPosition:(CGPoint)arg1 forced:(bool)arg2;
- (void)_updateRowsAtIndexPaths:(id)arg1 updateAction:(int)arg2;
- (void)_updateSections:(id)arg1 updateAction:(int)arg2;
- (void)_updateTrackedLayoutValuesWith:(id)arg1;
- (void)_updateTransitionWithProgress:(double)arg1;
- (NSUInteger)_updateVisibleCellsNow:(bool)arg1;
- (void)_updateWithItems:(id)arg1 tentativelyForReordering:(bool)arg2 animator:(id)arg3;
- (void)_userSelectItemAtIndexPath:(id)arg1;
- (id)_viewAnimationsForCurrentUpdate;
- (id)_viewControllerToNotifyOnLayoutSubviews;
- (bool)_viewIsReorderedCell:(id)arg1;
- (bool)_visible;
- (CGRect)_visibleBounds;
- (id)_visibleCellForIndexPath:(id)arg1;
- (id)_visibleDecorationViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (id)_visibleDecorationViewsOfKind:(id)arg1;
- (id)_visibleSupplementaryViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (id)_visibleSupplementaryViewOfKind:(id)arg1 atIndexPath:(id)arg2 isDecorationView:(bool)arg3;
- (id)_visibleSupplementaryViewsOfKind:(id)arg1;
- (id)_visibleSupplementaryViewsOfKind:(id)arg1 isDecorationView:(bool)arg2;
- (id)_visibleViewDictForElementCategory:(NSUInteger)arg1 elementKind:(id)arg2;
- (id)_visibleViewForLayoutAttributes:(id)arg1;
- (id)_visibleViews;
- (bool)allowsMultipleSelection;
- (bool)allowsSelection;
- (id)backgroundView;
- (bool)beginInteractiveMovementForItemAtIndexPath:(id)arg1;
- (bool)canBeEdited;
- (bool)canBecomeFirstResponder;
- (bool)canBecomeFocused;
- (void)cancelInteractiveMovement;
- (void)cancelInteractiveTransition;
- (id)cellForItemAtIndexPath:(id)arg1;
- (id)collectionViewLayout;
//- (id)dataSource;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)arg1;
- (void)deleteItemsAtIndexPaths:(id)arg1;
- (void)deleteSections:(id)arg1;
- (id)dequeueReusableCellWithReuseIdentifier:(id)arg1 forIndexPath:(id)arg2;
- (id)dequeueReusableSupplementaryViewOfKind:(id)arg1 withReuseIdentifier:(id)arg2 forIndexPath:(id)arg3;
- (id)description;
- (void)deselectItemAtIndexPath:(id)arg1 animated:(bool)arg2;
- (void)didMoveToWindow;
- (void)encodeRestorableStateWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (void)endInteractiveMovement;
- (void)finishInteractiveTransition;
- (NSInteger)highlightedGlobalItem;
- (id)indexPathForCell:(id)arg1;
- (id)indexPathForItemAtPoint:(CGPoint)arg1;
- (id)indexPathForSupplementaryView:(id)arg1;
//- (id)indexPathsForSelectedItems;
- (id)indexPathsForVisibleItems;
- (id)indexPathsForVisibleSupplementaryElementsOfKind:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithFrame:(CGRect)arg1;
- (id)initWithFrame:(CGRect)arg1 collectionViewLayout:(id)arg2;
- (void)insertItemsAtIndexPaths:(id)arg1;
- (void)insertSections:(id)arg1;
- (CGSize)intrinsicContentSize;
- (bool)isEditing;
- (bool)isPrefetchingEnabled;
- (id)layoutAttributesForItemAtIndexPath:(id)arg1;
- (id)layoutAttributesForSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)layoutSubviews;
- (NSInteger)maximumGlobalItemIndex;
- (void)moveItemAtIndexPath:(id)arg1 toIndexPath:(id)arg2;
- (void)moveSection:(NSInteger)arg1 toSection:(NSInteger)arg2;
- (NSInteger)numberOfItemsInSection:(NSInteger)arg1;
- (NSInteger)numberOfSections;
- (void)performBatchUpdates:(id /* block */)arg1 completion:(id /* block */)arg2;
- (void)performBatchUpdates:(id /* block */)arg1 withAnimator:(id)arg2;
- (id)preferredFocusedItem;
- (void)prefetchCompleteForItemAtIndexPath:(id)arg1;
- (id)prefetchDataSource;
- (id)preparedCells;
- (void)pressesBegan:(id)arg1 withEvent:(id)arg2;
- (void)pressesCancelled:(id)arg1 withEvent:(id)arg2;
- (void)pressesChanged:(id)arg1 withEvent:(id)arg2;
- (void)pressesEnded:(id)arg1 withEvent:(id)arg2;
- (void)registerClass:(Class)arg1 forCellWithReuseIdentifier:(id)arg2;
- (void)registerClass:(Class)arg1 forSupplementaryViewOfKind:(id)arg2 withReuseIdentifier:(id)arg3;
- (void)registerNib:(id)arg1 forCellWithReuseIdentifier:(id)arg2;
- (void)registerNib:(id)arg1 forSupplementaryViewOfKind:(id)arg2 withReuseIdentifier:(id)arg3;
- (void)reloadData;
- (void)reloadItemsAtIndexPaths:(id)arg1;
- (void)reloadSections:(id)arg1;
- (bool)remembersLastFocusedIndexPath;
- (void)scrollToItemAtIndexPath:(id)arg1 atScrollPosition:(NSUInteger)arg2 animated:(bool)arg3;
- (void)selectItemAtIndexPath:(id)arg1 animated:(bool)arg2 scrollPosition:(NSUInteger)arg3;
- (void)setAllowsMultipleSelection:(bool)arg1;
- (void)setAllowsSelection:(bool)arg1;
- (void)setBackgroundView:(id)arg1;
- (void)setBounds:(CGRect)arg1;
- (void)setCollectionViewLayout:(id)arg1;
- (void)setCollectionViewLayout:(id)arg1 animated:(bool)arg2;
- (void)setCollectionViewLayout:(id)arg1 animated:(bool)arg2 completion:(id /* block */)arg3;
- (void)setCollectionViewLayout:(id)arg1 withAnimator:(id)arg2;
- (void)setContentInset:(UIEdgeInsets)arg1;
- (void)setContentOffset:(CGPoint)arg1 animated:(bool)arg2;
- (void)setContentSize:(CGSize)arg1;
- (void)setDataSource:(id)arg1;
- (void)setDelegate:(id)arg1;
- (void)setEditing:(bool)arg1;
- (void)setFrame:(CGRect)arg1;
- (void)setLayoutMargins:(UIEdgeInsets)arg1;
- (void)setPrefetchDataSource:(id)arg1;
- (void)setPrefetchingEnabled:(bool)arg1;
- (void)setRemembersLastFocusedIndexPath:(bool)arg1;
- (void)setScrollEnabled:(bool)arg1;
- (void)setSemanticContentAttribute:(NSInteger)arg1;
- (id)startInteractiveTransitionToCollectionViewLayout:(id)arg1 completion:(id /* block */)arg2;
- (id)supplementaryViewForElementKind:(id)arg1 atIndexPath:(id)arg2;
- (void)touchesBegan:(id)arg1 withEvent:(id)arg2;
- (void)touchesCancelled:(id)arg1 withEvent:(id)arg2;




#endif

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if ([touches containsObject:_currentTouch]) {
        // loc_98b2ce
        [self _setCurrentTouch:nil];
        [super touchesEnded:touches withEvent:event];
        if ([self isDragging]) {
            // loc_98b327
            if (_pendingSelectionIndexPath != nil) {
                // loc_98b36f
                RDCollectionViewCell *cell = [self cellForItemAtIndexPath:_pendingSelectionIndexPath];
                if (cell != nil) {
                    // loc_98b38f
                    if (CGRectContainsPoint(self.bounds,  [_currentTouch locationInView:cell])) {
                        // loc_98b3f4
                        UIView *currentTouchView = [_currentTouch view];
                        if (currentTouchView != nil) {
                            // loc_98b3fd
                            NSIndexPath *indexPath = [self _selectableIndexPathForItemContainingHitView:currentTouchView];
                            if (indexPath != nil) {
                                // loc_98b435
                                if ([self _allowsEffectiveSelection]) {
                                    // loc_98b4a1
                                    if (_pendingSelectionIndexPath != nil) {
                                        // loc_98b4c2
                                    } else {
                                        // loc_98b4aa
                                        if (_allowsEffectiveMultipleSelection != nil) {
                                            // loc_98b4d2
                                        } else {
                                            // loc_98b4be
                                            
                                            // loc_98b4c2
                                            [self _userSelectItemAtIndexPath:_pendingSelectionIndexPath];
                                            // loc_98b4d2
                                            _pendingSelectionIndexPath = nil;
                                            // loc_98b511
                                        }
                                    }
                                } else {
                                    // loc_98b511
                                    // loc_98b524
                                    if (_pendingSelectionIndexPath != nil) {
                                        [self _unhighlightItemAtIndexPath:_pendingSelectionIndexPath animated:NO notifyDelegate:YES];
                                        _pendingSelectionIndexPath = nil;
                                    }
                                    
                                    for (NSIndexPath *selectedIndexPath in _indexPathsForSelectedItems) {
                                        RDCollectionViewCell *cell = [self cellForItemAtIndexPath:selectedIndexPath];
                                        if ([cell isSelected] == NO) {
                                            [cell _setSelected:YES animated:NO];
                                        }
                                    }
                                    
                                    
                                    for (NSIndexPath *pendingDeselectionIndexPath in _pendingDeselectionIndexPaths) {
                                        RDCollectionViewCell *cell = [self cellForItemAtIndexPath:pendingDeselectionIndexPath];
                                        if ([cell isSelected] == YES) {
                                            [cell _setSelected:NO animated:NO];
                                        }
                                    }
                                    _pendingDeselectionIndexPaths = nil;
                                    return
                                }
                            } else {
                                // loc_98b507
                                // loc_98b511
                            }
                        } else {
                            // loc_98b486
                            if ([self _allowsEffectiveSelection]) {
                                // loc_98b4a1
                            } else {
                                // loc_98b511
                            }
                        }
                    } else {
                        // loc_98b4e6
                        [_pendingDeselectionIndexPaths removeAllObjects];
                        // loc_98b511
                    }
                } else {
                    // loc_98b3f4
                }
            } else {
                // loc_98b3f4
            }
        } else {
            // loc_98b465
            // loc_98b524
        }
    } else {
        // loc_98b885
        return;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    if ([touches containsObject:_currentTouch]) {
        if (_pendingSelectionIndexPath != nil) {
            RDCollectionViewCell *cell = [self cellForItemAtIndexPath:_pendingSelectionIndexPath];
            if (cell != nil) {
                if (CGRectContainsPoint(self.bounds, [_currentTouch locationInView:cell])) {
                    if (![cell isHighlighted]) {
                         [self _highlightItemAtIndexPath:_pendingSelectionIndexPath animated:NO scrollPosition:0 notifyDelegate:YES];
                    }
                } else {
                    if ([cell isHighlighted]) {
                        [self _unhighlightItemAtIndexPath:_pendingSelectionIndexPath animated:NO notifyDelegate:YES];
                    }
                }
            }
        }
    }
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    if (previousTraitCollection != nil) {
        if ([previousTraitCollection horizontalSizeClass] != [[self traitCollection] horizontalSizeClass] ||
            [previousTraitCollection verticalSizeClass] != [[self traitCollection] verticalSizeClass]) {
            [self _resetPrefetchState];
        }
    }
}

- (void)updateInteractiveMovementTargetPosition:(CGPoint)targetPosition {
    [self _updateReorderingTargetPosition:targetPosition forced:NO]; // Verify
//    [_reorderFeedbackBehavior positionUpdated];
}

- (NSArray<__kindof RDCollectionViewCell *> *)visibleCells {
    [self _reloadDataIfNeeded];
    NSMutableArray<__kindof RDCollectionViewCell *> *result = [[NSMutableArray alloc] init];
    [_visibleCellsDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [result addObject:obj];
    }];
    return result;
}

- (NSArray<RDCollectionReusableView *> *)visibleSupplementaryViewsOfKind:(NSString *)elementKind {
    return [self _visibleSupplementaryViewsOfKind:elementKind];
    
}



@end
