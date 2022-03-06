[EE 582: Physical Design Automation of VLSI Circuits and Systems](https://eecs.wsu.edu/~daehyun/teaching/2014_EE582/assignments/a10/a10.html)

**1. Setup.**

1. Create a directory and download the following file to the directory.

2. - wget http://eecs.wsu.edu/~daehyun/teaching/2014_EE582/assignments/a10/a10.tar.gz

3. Untar it.

4. - `tar xvfz a10.tar.gz`

5. You will see a library directory (lib) and a design directory (design).

6. Go to the design directory. Run the following commands to load a given design.

7. - `source edi.sh`

8. - `encounter -init des.enc`

9. Once the design is loaded, run `"win"` to open the GUI window.

10. - `win`

11. Also, run the following command. Whenever you load a new design, you should run the following command.

12. - **setDelayCalMode -siAware false**

13. Read the followings carefully.

14. - The layout area is 5000um x 5um.

15. - The netlist is as follows: input -> BUF_X1 (driver) -> BUF_X1 (receiver) -> output

16. - The locations of the driver and the receiver are fixed (driver: 5um, receiver: 4995um).

17. - There is a routing blockage from metal 3 to metal 10. Therefore, routing will use only metal 1 and metal 2 layers.

18. - There are six types of buffers (BUF_X1, BUF_X2, BUF_X4, BUF_X8, BUF_X16, BUF_X32) in the library.

19. The followings show how to use the GUI window.

20. - Turn off the visibility of via2 to metal10 layers in the "Layer Control" window by clicking the "v" marks in the left column of the two "v" columns. By this, we disable the visibility of all metal and via layers above metal 2 so that we can see the routing.

21. - **Zoom in**: Click and hold the right mouse button, then draw a rectangular region you want to zoom in, and release the right mouse button.

22. - **Fit**: key "f"

23. - **Selection**: Click a net to see its name. If you click a net, its name will appear in the bottom left corner of the GUI window. Click an instance to see its name. If you click an instance, its name will appear in the bottom left corner of the GUI window.

24. - **Coordinates**: If you move the mouse pointer, the current coordinate appears in the bottom right status bar in the GUI window.

25. You will use the following commands to insert buffers.

26. - **report_timing**: reports timing.

27. - **routeDesign**: routes the design.

28. - **ecoAddRepeater**: inserts a buffer. See the following usage.

    - - ecoAddRepeater -net *net_name* -cell *buffer_name* -loc *coordinate*

    - - Example: ecoAddRepeater -net n1 -cell BUF_X4 -loc {2500 5}

29. - **ecoDeleteRepeater**: deletes a buffer. See the following usage.

    - - ecoDeleteRepeater -inst *instance_name*

    - - Example: ecoDeleteRepeater -inst FE_ECOC1_n1

30. - **ecoChangeCell**: changes type of an instance. See the following usage.

    - - ecoChangeCell -inst *instance_name* -cell *cell_name*

    - - Example: ecoChangeCell -inst FE_ECOC1_n1 -cell BUF_X8

31. **If you modify (perturb) the current layout (e.g., insert a buffer, delete a buffer, change the type of a cell, etc.), you should run "routeDesign" to route the design before you run "report_timing".**

------

**2. Buffer insertion**

1. Run "report_timing" to obtain the initial slack (S1). **Show this initial slack in your report.**
2. Insert a buffer of type BUF_X1 into the center of the layout (2500, 5).
3. Run "routeDesign" to re-route the design.
4. Run "report_timing" to obtain a new slack (S2). Did it increase or decrease? **Show this slack in your report.**
5. Change the type of the inserted buffer to "BUF_X4". Re-route and get a new slack value (S3). Did it increase or decrease? **Show this slack in your report.**
6. Insert another buffer of type BUF_X4 into (1250, 5). Note that you should always check the name of the net you are optimizing before you run "ecoAddRepeater". Re-route and get a slack (S4). Did it increase or decrease? **Show this slack in your report.**
7. Insert another buffer of type BUF_X4 into (3750, 5). Re-route and get a slack (S5). Did it increase or decrease? **Show this slack in your report.**
8. Delete all the inserted buffers. Re-route the design and get a slack (S6). This slack should be the same as the initial slack (S1).

------

**3. Optimal buffer insertion**

- You are supposed to insert ***N*** buffers of type BUF_X8 into the net (1 <= ***N*** <= 5>) between the driver and the receiver.

- You can decide ***N*** and the locations of the buffers.

- The goal is to minimize the delay from the driver to the receiver.

- Insert the buffers into the net and get a slack.

- **Submit the followings:**

- - Explanation on how you decided ***N***.
  - The locations of the buffers.
  - The final slack value after buffer insertion.
  - Explanation on how you decided the locations of the buffers.

- Note: Before you try "trial-and-error", try to somehow analytically find the optimal locations of the buffers when the number of buffers is *K*.