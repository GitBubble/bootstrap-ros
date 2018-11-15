;;;; Set up *BUGID->KNOWNP* for clocc-ansi.test.sh.

;;;; This software is part of the SBCL system. See the README file for
;;;; more information.
;;;;
;;;; While most of SBCL is derived from the CMU CL system, the test
;;;; files (like this one) were written from scratch after the fork
;;;; from CMU CL.
;;;;
;;;; This software is in the public domain and is provided with
;;;; absolutely no warranty. See the COPYING and CREDITS files for
;;;; more information.

(in-package :cl-user)

;;; bugs, bugs, bugs
(defvar *bugid->knownp* (make-hash-table))
(map nil
     (lambda (bugid)
       (setf (gethash bugid *bugid->knownp*)
             t))
     #(;; FIXME: several metaproblems here, over and above the primary
       ;; problem represented by the honking big bug list..
       ;;   * This list was generated automatically from test output
       ;;     from my locally patched copy of ansi-test. I can't
       ;;     use the CVS version of ansi-test until they patch it
       ;;     it to support BUGIDs; and there's no guarantee that
       ;;   * Once BUGIDs are stable, there should probably be comments
       ;;     for bugs and groups of bugs explaining what's going on.
       ;;   * Once BUGIDs are stable, the ansi-test-related entries in
       ;;     BUGS should probably be deleted in favor of the BUGIDs
       ;;     and comments here.
       :ALLTEST-LEGACY-77
       :ALLTEST-LEGACY-391
       :ALLTEST-LEGACY-1605
       :ALLTEST-LEGACY-1613
       :ALLTEST-LEGACY-1715
       :ALLTEST-LEGACY-1723

       ;; bug 45c
       #+(and linux x86) :ALLTEST-LEGACY-1814
       #+(and linux x86) :ALLTEST-LEGACY-1818
       #+(and linux x86) :ALLTEST-LEGACY-1822
       #+(and linux x86) :ALLTEST-LEGACY-1826
       #+(and linux x86) :ALLTEST-LEGACY-1830
       #+(and linux x86) :ALLTEST-LEGACY-1834
       #+(and linux x86) :ALLTEST-LEGACY-1838
       #+(and linux x86) :ALLTEST-LEGACY-1842

       :ALLTEST-LEGACY-2204
       :CLOS-LEGACY-170
       :CMUCL-BUGS-LEGACY-292
       :CMUCL-BUGS-LEGACY-501
       :CMUCL-BUGS-LEGACY-517
       :CMUCL-BUGS-LEGACY-580
       :CONDITIONS-LEGACY-70
       :CONDITIONS-LEGACY-74
       :CONDITIONS-LEGACY-78
       :CONDITIONS-LEGACY-82
       :CONDITIONS-LEGACY-86
       :CONDITIONS-LEGACY-90
       :CONDITIONS-LEGACY-94
       :CONDITIONS-LEGACY-98
       :CONDITIONS-LEGACY-102
       :CONDITIONS-LEGACY-106
       :CONDITIONS-LEGACY-110
       :CONDITIONS-LEGACY-114
       :CONDITIONS-LEGACY-118
       :CONDITIONS-LEGACY-122
       :CONDITIONS-LEGACY-126
       :CONDITIONS-LEGACY-130
       :CONDITIONS-LEGACY-134
       :CONDITIONS-LEGACY-138
       :CONDITIONS-LEGACY-142
       :CONDITIONS-LEGACY-146
       :CONDITIONS-LEGACY-150
       :CONDITIONS-LEGACY-154
       :CONDITIONS-LEGACY-158
       :CONDITIONS-LEGACY-162
       :CONDITIONS-LEGACY-166
       :CONDITIONS-LEGACY-170
       :CONDITIONS-LEGACY-174
       :CONDITIONS-LEGACY-178
       :CONDITIONS-LEGACY-182
       :CONDITIONS-LEGACY-201
       :CONDITIONS-LEGACY-209
       :CONDITIONS-LEGACY-217
       :EXCEPSIT-LEGACY-77
       :EXCEPSIT-LEGACY-85
       :EXCEPSIT-LEGACY-125
       :EXCEPSIT-LEGACY-133
       :EXCEPSIT-LEGACY-145
       :EXCEPSIT-LEGACY-149
       :EXCEPSIT-LEGACY-165
       :EXCEPSIT-LEGACY-174
       :EXCEPSIT-LEGACY-211
       :EXCEPSIT-LEGACY-267
       :EXCEPSIT-LEGACY-271
       :EXCEPSIT-LEGACY-275
       :EXCEPSIT-LEGACY-279
       :EXCEPSIT-LEGACY-283
       :EXCEPSIT-LEGACY-287
       :EXCEPSIT-LEGACY-291
       :EXCEPSIT-LEGACY-295
       :EXCEPSIT-LEGACY-299
       :EXCEPSIT-LEGACY-311
       :EXCEPSIT-LEGACY-323
       :EXCEPSIT-LEGACY-360
       :EXCEPSIT-LEGACY-368
       :EXCEPSIT-LEGACY-377
       :EXCEPSIT-LEGACY-386
       :EXCEPSIT-LEGACY-395
       :EXCEPSIT-LEGACY-404
       :EXCEPSIT-LEGACY-413
       :EXCEPSIT-LEGACY-465
       :EXCEPSIT-LEGACY-621
       :EXCEPSIT-LEGACY-664
       :EXCEPSIT-LEGACY-684
       :EXCEPSIT-LEGACY-712
       :EXCEPSIT-LEGACY-740
       :EXCEPSIT-LEGACY-796
       :EXCEPSIT-LEGACY-807
       :EXCEPSIT-LEGACY-863
       :EXCEPSIT-LEGACY-875
       :EXCEPSIT-LEGACY-899
       :EXCEPSIT-LEGACY-903
       :EXCEPSIT-LEGACY-935
       :EXCEPSIT-LEGACY-947
       :EXCEPSIT-LEGACY-951
       :EXCEPSIT-LEGACY-971
       :EXCEPSIT-LEGACY-995
       :EXCEPSIT-LEGACY-1007
       :EXCEPSIT-LEGACY-1015
       :EXCEPSIT-LEGACY-1054
       :EXCEPSIT-LEGACY-1058
       :EXCEPSIT-LEGACY-1197
       :EXCEPSIT-LEGACY-1201
       :EXCEPSIT-LEGACY-1269
       :EXCEPSIT-LEGACY-1273
       :EXCEPSIT-LEGACY-1327
       :EXCEPSIT-LEGACY-1357
       :EXCEPSIT-LEGACY-1369
       :EXCEPSIT-LEGACY-1381
       :EXCEPSIT-LEGACY-1397
       :EXCEPSIT-LEGACY-1401
       :EXCEPSIT-LEGACY-1405
       :EXCEPSIT-LEGACY-1445
       :EXCEPSIT-LEGACY-1546
       :EXCEPSIT-LEGACY-1567
       :EXCEPSIT-LEGACY-1571
       :FORMAT-LEGACY-302
       :FORMAT-LEGACY-308
       :FORMAT-LEGACY-322
       :FORMAT-LEGACY-334
       :HASHLONG-LEGACY-61
       :IOFKTS-LEGACY-68
       :IOFKTS-LEGACY-72
       :IOFKTS-LEGACY-76
       :IOFKTS-LEGACY-737
       :IOFKTS-LEGACY-775
       :IOFKTS-LEGACY-791

       ;; (These aren't really separate bugs, but 804 depends on a
       ;; side effect of 791, and then 812 depends on a side effect of
       ;; 804, so that as long as 791 is suppressed we need to
       ;; suppress these too.)
       :IOFKTS-LEGACY-804
       :IOFKTS-LEGACY-812

       :IOFKTS-LEGACY-881
       :IOFKTS-LEGACY-894
       :LAMBDA-LEGACY-226
       :LISTS152-LEGACY-491
       :LISTS152-LEGACY-500
       :LISTS155-LEGACY-123
       :LOOP-LEGACY-222
       :MACRO8-LEGACY-126
       :NEW-BUGS-LEGACY-26
       :SECTION12-LEGACY-78
       :SECTION12-LEGACY-775
       :SECTION12-LEGACY-789
       :SECTION12-LEGACY-833
       :SECTION12-LEGACY-849
       :SECTION17-LEGACY-93
       :SECTION17-LEGACY-99
       :SECTION17-LEGACY-105
       :SECTION17-LEGACY-632
       :SECTION17-LEGACY-674
       :SECTION22-LEGACY-200
       :SECTION3-LEGACY-410
       :SECTION3-LEGACY-669
       :SECTION3-LEGACY-686
       :SECTION3-LEGACY-703
       :SECTION3-LEGACY-718
       :SECTION3-LEGACY-733
       :SECTION3-LEGACY-750
       :SECTION3-LEGACY-783
       ;; DEFINE-SYMBOL-MACRO stuff fixed by NJF patch merged 2002-03-31:
       ;;   :SECTION3-LEGACY-807
       ;;   :SECTION3-LEGACY-812
       ;;   :SECTION3-LEGACY-816
       ;;   :SECTION3-LEGACY-820
       ;;   :SECTION3-LEGACY-824
       ;;   :SECTION3-LEGACY-832
       ;;   :SECTION3-LEGACY-844
       :SECTION4-LEGACY-111
       :SECTION4-LEGACY-115
       :SECTION4-LEGACY-119
       :SECTION4-LEGACY-123
       :SECTION4-LEGACY-127
       :SECTION4-LEGACY-131
       :SECTION4-LEGACY-135
       :SECTION4-LEGACY-208
       :SECTION4-LEGACY-295
       :SECTION6-LEGACY-162
       :SETF-LEGACY-233
       :SETF-LEGACY-346
       :SETF-LEGACY-420
       :SETF-LEGACY-426
       :SETF-LEGACY-433
       :SETF-LEGACY-480
       :SETF-LEGACY-499
       :SETF-LEGACY-504
       :STREAMS-LEGACY-10
       :STREAMS-LEGACY-938
       :STREAMS-LEGACY-944
       :STREAMS-LEGACY-951
       :STREAMS-LEGACY-1269
       :STREAMS-LEGACY-1297
       :STRINGS-LEGACY-1241
       :STRINGS-LEGACY-1281
       :STRINGS-LEGACY-1320
       :SYMBOL10-LEGACY-87
       :SYMBOL10-LEGACY-95
       :SYMBOL10-LEGACY-104
       :SYMBOL10-LEGACY-115
       :SYMBOL10-LEGACY-124
       :SYMBOL10-LEGACY-135
       :SYMBOL10-LEGACY-146
       :SYMBOL10-LEGACY-159
       :SYMBOL10-LEGACY-168
       :SYMBOL10-LEGACY-177
       :SYMBOL10-LEGACY-184
       :SYMBOL10-LEGACY-188
       :SYMBOL10-LEGACY-192
       :SYMBOL10-LEGACY-196
       :SYMBOL10-LEGACY-203
       :SYMBOL10-LEGACY-206
       :SYMBOL10-LEGACY-209
       :SYMBOL10-LEGACY-219
       :SYMBOL10-LEGACY-224
       :SYMBOL10-LEGACY-237
       :SYMBOL10-LEGACY-244
       :SYMBOL10-LEGACY-254
       :SYMBOL10-LEGACY-259
       :SYMBOL10-LEGACY-262
       :SYMBOL10-LEGACY-265
       :SYMBOL10-LEGACY-269
       :SYMBOL10-LEGACY-279
       :SYMBOL10-LEGACY-282
       :SYMBOL10-LEGACY-285
       :SYMBOL10-LEGACY-289
       :SYMBOL10-LEGACY-300
       :SYMBOL10-LEGACY-303
       :SYMBOL10-LEGACY-306
       :SYMBOL10-LEGACY-310
       :SYMBOL10-LEGACY-324
       :SYMBOL10-LEGACY-330
       :SYMBOL10-LEGACY-342
       :SYMBOL10-LEGACY-360
       :SYMBOL10-LEGACY-382
       :SYMBOL10-LEGACY-394
       :SYMBOL10-LEGACY-398
       :SYMBOL10-LEGACY-417
       :SYMBOL10-LEGACY-428
       :SYMBOL10-LEGACY-438
       :SYMBOL10-LEGACY-442
       :SYMBOL10-LEGACY-446
       :SYMBOL10-LEGACY-452
       :SYMBOL10-LEGACY-466
       :SYMBOL10-LEGACY-477
       :SYMBOL10-LEGACY-490
       :SYMBOL10-LEGACY-495
       :SYMBOL10-LEGACY-499
       :SYMBOL10-LEGACY-503
       :SYMBOL10-LEGACY-513
       :SYMBOL10-LEGACY-516
       :SYMBOL10-LEGACY-519
       :SYMBOL10-LEGACY-532
       :SYMBOL10-LEGACY-536
       :SYMBOL10-LEGACY-540
       :SYMBOL10-LEGACY-549
       :SYMBOL10-LEGACY-554
       :SYMBOL10-LEGACY-560
       :SYMBOL10-LEGACY-563
       :SYMBOL10-LEGACY-567
       :SYMBOL10-LEGACY-574
       :SYMBOL10-LEGACY-577
       :SYMBOL10-LEGACY-581
       :SYMBOL10-LEGACY-586
       :SYMBOL10-LEGACY-589
       :SYMBOL10-LEGACY-593
       :SYMBOL10-LEGACY-604
       :SYMBOL10-LEGACY-616
       :SYMBOL10-LEGACY-620
       :SYMBOL10-LEGACY-632
       :SYMBOL10-LEGACY-636
       :SYMBOL10-LEGACY-640
       :SYMBOL10-LEGACY-644
       :SYMBOL10-LEGACY-657
       :SYMBOL10-LEGACY-662
       :SYMBOL10-LEGACY-668
       :SYMBOL10-LEGACY-672
       :SYMBOL10-LEGACY-676
       :SYMBOL10-LEGACY-689
       :SYMBOL10-LEGACY-698
       :TYPE-LEGACY-298
       :TYPE-LEGACY-351))
