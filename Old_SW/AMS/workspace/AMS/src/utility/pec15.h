/*
 * pec15.h
 *
 *  Created on: 20. mar. 2019
 *      Author: matt
 */

/************************************
 * Copyright 2012 Analog Devices, Inc. (ADI)
 * Permission to freely use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies:
 * THIS SOFTWARE IS PROVIDED “AS IS” AND ADI DISCLAIMS ALL WARRANTIES IN-CLUDING
 * ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL ADI BE
 * LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
 * DAMAGES WHATSOEVER RESULTING FROM ANY USE OF SAME, INCLUDING ANY LOSS OF USE
 * OR DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTUOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
 * OF THIS SOFTWARE.
 ***************************************/

#ifndef SRC_PEC15_H_
#define SRC_PEC15_H_

#include "stdint.h"

//void init_PEC15_Table();

uint16_t pec15(uint8_t *data , int len);

uint8_t pec_check(uint8_t *data);

#endif /* SRC_PEC15_H_ */
